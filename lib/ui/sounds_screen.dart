import 'dart:math';
import 'dart:ui';

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:just_audio/just_audio.dart';
import 'package:simple_waveform_progressbar/simple_waveform_progressbar.dart';
import 'package:sliding_up_panel2/sliding_up_panel2.dart';
import 'package:video_application/just_audio_provider.dart';
import 'package:video_application/service/sounds/selected_sound/selected_sound_service.dart';
import 'package:video_application/service/sounds/sounds_service.dart';

var slidingController = StateProvider((ref) => PanelController());
var soundIdProvider = StateProvider((ref) => 0);
var currentDurationProvider = StateProvider((ref) => const Duration());
var isAudioPlaying = StateProvider((ref) => false);
var justAudioNotifer = StateProvider((ref) => AudioPlayer());

class SoundsScreen extends ConsumerWidget {
  const SoundsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var soundsProvider = ref.watch(soundsServiceProvider);
    var slider = ref.watch(slidingController);
    var soundId = ref.watch(soundIdProvider);
    var playerPlaying = ref.watch(isAudioPlaying);

    var playListProvider = ref.watch(playlistProvider);
    var audioProvider = ref.watch(audioPlayerProvider);
    var currentDurationProvider = ref.watch(currentPositionProvider);
    var playingProvider = ref.watch(currentlyPlayingProvider);
    var totalDuration = ref.watch(totalDurationProvider);
    var bufferProvider = ref.watch(bufferedPlayerPosition);
    return Scaffold(
      body: SafeArea(
          child: SlidingUpPanel(
        controller: ref.read(slidingController),
        minHeight: 0,
        parallaxEnabled: true,
        borderRadius: BorderRadius.circular(10),
        backdropEnabled: false,
        maxHeight: context.height / 1.2,
        panelBuilder: () => soundsProvider.when(
            data: (data) => Column(
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
                            slider.close();
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
                              "https://thrill.fun/public/uploads/profile_images/${data.data?[soundId].soundOwner?.avtars}"),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      data.data?[soundId].soundOwner?.name ?? "",
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
                      data.data?[soundId].sound ?? "",
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
                        data: (bufferPosition) => currentDurationProvider.when(
                            data: (audio) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: 50,
                                    child: Center(
                                      child: WaveformProgressbar(
                                        color: Colors.grey,
                                        progressColor: Colors.red,
                                        progress: (audio.inSeconds /
                                            (audioProvider.duration ??
                                                    Duration.zero)
                                                .inSeconds),
                                        // onTap: (progress) {
                                        //   // var nextProgress = (progress * 10);
                                        //   // audioProvider.seek(Duration(
                                        //   //     seconds: nextProgress.toInt()));
                                        // },
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
                                  playerPlaying = false;
                                } else {
                                  audioProvider.play();
                                  playerPlaying = true;
                                }
                              },
                              child: playingProvider.when(
                                  data: (isPlaying) => Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          InkWell(
                                            child: const Icon(
                                              Icons.rotate_left,
                                              color: Colors.red,
                                            ),
                                            onTap: () {
                                              audioProvider.seek(audio -
                                                  const Duration(seconds: 2));
                                            },
                                          ),
                                          Container(
                                            padding: const EdgeInsets.all(20),
                                            margin: const EdgeInsets.all(20),
                                            decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.red),
                                            child: isPlaying &&
                                                    audio.inSeconds !=
                                                        audioProvider
                                                            .duration!.inSeconds
                                                ? const Icon(
                                                    Icons.pause,
                                                    color: Colors.white,
                                                  )
                                                : const Icon(
                                                    Icons.play_arrow,
                                                    color: Colors.white,
                                                  ),
                                          ),
                                          InkWell(
                                            child: const Icon(
                                              Icons.rotate_right,
                                              color: Colors.red,
                                            ),
                                            onTap: () {
                                              audioProvider.seek(audio +
                                                  const Duration(seconds: 2));
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
                ),
            error: (error, s) {
              print(error.toString() + s.toString());
              return Text(error.toString() + s.toString());
            },
            loading: () => const CircularProgressIndicator()),

        // ProgressBar(
        //                           thumbRadius: 5.0,
        //                           thumbGlowRadius: 7.0,
        //                           timeLabelType:
        //                               TimeLabelType.remainingTime,
        //                           timeLabelTextStyle: const TextStyle(
        //                               fontSize: 12,
        //                               fontWeight: FontWeight.w700),
        //                           thumbColor: Colors.red,
        //                           baseBarColor: Colors.red.shade100,
        //                           thumbGlowColor: Colors.red,
        //                           bufferedBarColor: Colors.red.shade900,
        //                           progressBarColor: Colors.red,
        //                           onSeek: (value) =>
        //                               audioProvider.seek(value),
        //                           progress: audio,
        //                           buffered: bufferPosition,
        //                           total: audioProvider.duration ??
        //                               Duration.zero),
        body: soundsProvider.when(
            data: (data) => ListView.builder(
                itemCount: data.data?.length ?? 0,
                itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () async {
                          ref.read(playlistProvider.notifier).state =
                              'https://thrillvideonew.s3.ap-south-1.amazonaws.com/sound/${data.data?[index].sound}';
                          // await ref
                          //     .read(justAudioNotifer.notifier)
                          //     .state
                          //     .setUrl(
                          //         'https://thrillvideonew.s3.ap-south-1.amazonaws.com/sound/${data.data?[index].sound}')
                          //     .then((value) {
                          //   ref.read(currentDurationProvider.notifier).state =
                          //       value!;
                          // });

                          slider.open();

                          ref.read(soundIdProvider.notifier).state = index;

                          // await ref
                          //     .read(selectedSoundServiceProvider(
                          //             data.data?[index].id ?? 469)
                          //         .notifier)
                          //     .getSoundById()
                          //     .then((value) {
                          //   print(value.data?.name);
                          // });
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
                                      "https://thrill.fun/public/uploads/profile_images/${data.data?[index].soundOwner?.avtars}"),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data.data?[index].soundOwner?.name ??
                                      data.data?[index].soundOwner?.username ??
                                      "",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  data.data?[index].sound ?? "",
                                  overflow: TextOverflow.ellipsis,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )),
            error: (error, trace) => Text(error.toString() + trace.toString()),
            loading: () => const CircularProgressIndicator()),
      )),
    );
  }
}
