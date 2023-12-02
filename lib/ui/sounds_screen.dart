import 'dart:math';
import 'dart:ui';

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:just_audio/just_audio.dart';
import 'package:simple_waveform_progressbar/simple_waveform_progressbar.dart';
import 'package:sliding_up_panel2/sliding_up_panel2.dart';
import 'package:video_application/just_audio_provider.dart';
import 'package:video_application/modal_classes/sounds_model.dart';
import 'package:video_application/service/sounds/selected_sound/selected_sound_service.dart';
import 'package:video_application/service/sounds/sounds_service.dart';

var slidingController = StateProvider((ref) => PanelController());
var currentDurationProvider = StateProvider((ref) => const Duration());
var isAudioPlaying = StateProvider((ref) => false);
var justAudioNotifer = StateProvider((ref) => AudioPlayer());

PagingController<int, Datum> soundsPagingController =
PagingController(firstPageKey: 1);
class SoundsScreen extends ConsumerWidget {
  const SoundsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {



    var audioProvider = ref.watch(audioPlayerProvider);
    var currentDurationProvider = ref.watch(currentPositionProvider);
    var playingProvider = ref.watch(currentlyPlayingProvider);
    var bufferProvider = ref.watch(bufferedPlayerPosition);


    return Scaffold(
      body: SafeArea(
          child: PagedListView<int, Datum>(
        pagingController: soundsPagingController..addPageRequestListener((pageKey) async {
          try {
            final newItems = await ref
                .read(soundsServiceProvider(pageKey).notifier)
                .getSoundsList();
            print(newItems.first.sound);
            final isLastPage = newItems.length < 7;
            if (isLastPage) {
              soundsPagingController.appendLastPage(newItems);
            } else {
              final nextPageKey = pageKey + 1;
              soundsPagingController.appendPage(newItems, nextPageKey);
            }
          } catch (error,stack) {
            print(error);
            print(stack);
            soundsPagingController.error = error;

          }
        })..addStatusListener((status) {
          if(status == PagingStatus.completed){
            print(status);
          }
          print(status);
        }),
        
        builderDelegate: PagedChildBuilderDelegate(
          firstPageErrorIndicatorBuilder: (context)=>Text('error'),
            newPageErrorIndicatorBuilder: (context)=>Text('error'),
            itemBuilder: (context, item, index) => Padding(
                  padding: const EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () async {
                      ref.watch(playlistProvider.notifier).state =
                          'https://thrillvideonew.s3.ap-south-1.amazonaws.com/sound/${item.sound}';

                      showModalBottomSheet(
                          context: context,
                          builder: (context) => Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                      child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      child: InkWell(
                                        child: const Icon(Icons.close_outlined),
                                        onTap: () {
                                        },
                                      ),
                                    ),
                                  )),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: CachedNetworkImage(
                                        width: context.width / 1.5,
                                        height: context.height / 2.5,
                                        fit: BoxFit.cover,
                                        imageUrl:
                                            "https://thrill.fun/public/uploads/profile_images/${item.soundOwner?.avtars}"),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    item.soundOwner?.name ?? "",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      shadows: <Shadow>[
                                        Shadow(
                                          offset: Offset(0.0, 0.0),
                                          blurRadius: 3.0,
                                          color: Colors.white,
                                        ),
                                        Shadow(
                                          offset: Offset(0.0, 0.0),
                                          blurRadius: 10.0,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    item.sound ?? "",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      shadows: <Shadow>[
                                        Shadow(
                                          offset: Offset(0.0, 0.0),
                                          blurRadius: 3.0,
                                          color: Colors.white,
                                        ),
                                        Shadow(
                                          offset: Offset(0.0, 0.0),
                                          blurRadius: 10.0,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Expanded(child: SizedBox()),
                                  bufferProvider.when(
                                      data: (bufferPosition) =>
                                          currentDurationProvider.when(
                                              data: (audio) => Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 10),
                                                    child: SizedBox(
                                                      width: double.infinity,
                                                      height: 50,
                                                      child: Center(
                                                        child:
                                                            WaveformProgressbar(
                                                          color: Colors.grey,
                                                          progressColor:
                                                              Colors.red,
                                                          progress: (audio
                                                                  .inSeconds /
                                                              (audioProvider
                                                                          .duration ??
                                                                      Duration
                                                                          .zero)
                                                                  .inSeconds),

                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                              error: (_, l) => Container(),
                                              loading: () => Container()),
                                      error: (error, stack) => Container(),
                                      loading: () => Container()),
                                  currentDurationProvider.when(
                                      data: (audio) {
                                        if (audio.inSeconds ==
                                            audioProvider.duration?.inSeconds) {
                                          audioProvider.seek(Duration.zero);
                                          audioProvider.pause();
                                        }
                                        ;
                                        return InkWell(
                                            onTap: () async {
                                              if (audioProvider.playing) {
                                                audioProvider.pause();
                                              } else {
                                                audioProvider.play();
                                              }
                                            },
                                            child: playingProvider.when(
                                                data: (isPlaying) => Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        InkWell(
                                                          child: const Icon(
                                                            Icons.rotate_left,
                                                            color: Colors.red,
                                                          ),
                                                          onTap: () {
                                                            audioProvider.seek(
                                                                audio -
                                                                    const Duration(
                                                                        seconds:
                                                                            2));
                                                          },
                                                        ),
                                                        Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(20),
                                                          margin:
                                                              const EdgeInsets
                                                                  .all(20),
                                                          decoration:
                                                              const BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  color: Colors
                                                                      .red),
                                                          child: isPlaying &&
                                                                  audio.inSeconds !=
                                                                      audioProvider
                                                                          .duration!
                                                                          .inSeconds
                                                              ? const Icon(
                                                                  Icons.pause,
                                                                  color: Colors
                                                                      .white,
                                                                )
                                                              : const Icon(
                                                                  Icons
                                                                      .play_arrow,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                        ),
                                                        InkWell(
                                                          child: const Icon(
                                                            Icons.rotate_right,
                                                            color: Colors.red,
                                                          ),
                                                          onTap: () {
                                                            audioProvider.seek(
                                                                audio +
                                                                    const Duration(
                                                                        seconds:
                                                                            2));
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                error: (_, s) => Container(),
                                                loading: () => Container()));
                                      },
                                      error: (_, l) => Container(),
                                      loading: () => Container()),
                                ],
                              ));



                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                              height: 50,
                              width: 50,
                              fit: BoxFit.fill,
                              imageUrl:
                                  "https://thrill.fun/public/uploads/profile_images/${item.soundOwner?.avtars}"),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.soundOwner?.name ??
                                  item.soundOwner?.username ??
                                  "",
                              style:
                                  const TextStyle(fontWeight: FontWeight.w700),
                            ),
                            Text(
                              item.sound ?? "",
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )),
      )),
    );
  }
}
