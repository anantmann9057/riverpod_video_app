import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/utils.dart';
import 'package:just_audio/just_audio.dart';
import 'package:sliding_up_panel2/sliding_up_panel2.dart';
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
    var selectedSoundProvier = ref.watch(selectedSoundServiceProvider(soundId));
    var currentDuration = ref.watch(currentDurationProvider);
    var playerPlaying = ref.watch(isAudioPlaying);
    var playerDuration = ref.watch(justAudioNotifer);
    return Scaffold(
      body: SafeArea(
          child: SlidingUpPanel(
        controller: ref.read(slidingController),
        minHeight: 0,
        parallaxEnabled: true,
        borderRadius: BorderRadius.circular(10),
        backdropEnabled: true,
        maxHeight: context.height / 1.2,
        panelBuilder: () => soundsProvider.when(
            data: (data) => Column(
                  children: [
                    Expanded(
                        child: CachedNetworkImage(
                            height: context.height / 2,
                            width: context.width / 2,
                            fit: BoxFit.fill,
                            imageUrl:
                                "https://thrill.fun/public/uploads/profile_images/${data.data?[soundId].soundOwner?.avtars}")),
                    InkWell(
                      onTap: () async {
                        if (ref.read(isAudioPlaying.notifier).state == false) {
                          await ref
                              .read(justAudioNotifer.notifier)
                              .state
                              .play();
                          ref.read(isAudioPlaying.notifier).state = true;
                        } else {
                          await ref
                              .read(justAudioNotifer.notifier)
                              .state
                              .pause();
                          ref.read(isAudioPlaying.notifier).state = false;
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.red),
                        child: playerPlaying == true
                            ? const Icon(Icons.pause)
                            : const Icon(Icons.play_arrow),
                      ),
                    ),
                    Text(playerDuration.position.toString())
                  ],
                ),
            error: (error, s) {
              print(error.toString() + s.toString());
              return Text(error.toString() + s.toString());
            },
            loading: () => const CircularProgressIndicator()),
        body: soundsProvider.when(
            data: (data) => ListView.builder(
                itemCount: data.data?.length ?? 0,
                itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () async {
                          await ref
                              .read(justAudioNotifer.notifier)
                              .state
                              .setUrl(
                                  'https://thrillvideonew.s3.ap-south-1.amazonaws.com/sound/${data.data?[index].sound}')
                              .then((value) {
                            slider.open();
                          });
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
                                  data.data?[index].name ?? "",
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
