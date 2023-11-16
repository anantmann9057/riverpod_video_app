import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';
import 'package:sliding_up_panel2/sliding_up_panel2.dart';
import 'package:video_application/modal_classes/video_model.dart';
import 'package:video_application/modal_classes/videos_like_model.dart';
import 'package:video_application/service/api_service.dart';
import 'package:video_application/service/authentication/authentication_service.dart';
import 'package:video_application/service/comments/comments_service.dart';
import 'package:video_application/service/videos/video_service.dart';
import 'package:video_application/widgets/image_widgets.dart';
import 'package:video_player/video_player.dart';

final selectedBottomIndex = StateProvider((ref) => 0);

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var videosList = ref.watch(videoServiceProvider);
    var selectedVideoIndex = ref.watch(selectedIndex);

    var isLike = ref.watch(isLikeProvider);
    var totalLikes = ref.watch(totalLikesProvider);
    var duration = ref.watch(videoDuration);
    var commentsId = ref.watch(commentsServiceProvider);
    ref.watch(selectedBottomIndex);

    return Scaffold(
      body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: RefreshIndicator(
              child: videosList.when(
                  data: (data) {
                    return PageView.builder(
                        scrollDirection: Axis.vertical,
                        onPageChanged: (index) {
                          selectedVideoIndex = index;
                          if (index == (data.data?.length ?? 0) - 1) {
                            ref
                                .read(videoServiceProvider.notifier)
                                .getAllVideos(page: 2);
                          }
                          ref
                              .read(commentsServiceProvider.notifier)
                              .getComments(data.data?[index].id ?? 0);

                          ref
                              .read(videoServiceProvider.notifier)
                              .getLikes(data.data?[index].id ?? 0)
                              .then((value) {
                            ref.read(isLikeProvider.notifier).state =
                                value.data?.isLike.toString() == '0'
                                    ? false
                                    : true;
                            ref.read(totalLikesProvider.notifier).state =
                                value.data?.likes ?? 0;
                          });

                          ref.read(commentsIdProvider.notifier).state =
                              data.data?[index].id ?? 0;
                        },
                        itemCount: data.data?.length,
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              HomeVideoPLayer(
                                data.data?[index],
                              ),
                              Align(
                                child: InkWell(
                                  onTap: () async {
                                    ref
                                        .read(videoServiceProvider.notifier)
                                        .likeVideo(
                                            data.data?[index].id ?? 0,
                                            ref
                                                    .read(
                                                        isLikeProvider.notifier)
                                                    .state
                                                ? 0
                                                : 1)
                                        .then((value) {
                                      ref.read(isLikeProvider.notifier).state =
                                          value.data?.isLike.toString() == '0'
                                              ? false
                                              : true;

                                      ref
                                          .read(totalLikesProvider.notifier)
                                          .state = value.data?.likes ?? 0;
                                    });
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        !isLike
                                            ? Icons.favorite_border_outlined
                                            : Icons.favorite_rounded,
                                        color: Colors.red,
                                      ),
                                      Text(
                                        '$totalLikes',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          shadows: <Shadow>[
                                            Shadow(
                                              offset: const Offset(0.0, 0.0),
                                              blurRadius: 3.0,
                                              color:
                                                  Colors.black.withOpacity(0.2),
                                            ),
                                            Shadow(
                                              offset: const Offset(0.0, 0.0),
                                              blurRadius: 3.0,
                                              color: Colors.red.shade100,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "${duration.inSeconds}:${duration.inMilliseconds.toInt()}",
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 24),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: ref.read(commentsServiceProvider).when(
                                      data: (data) => Text(
                                          data.data?.length.toString() ?? ''),
                                      error: (error, _) => Container(),
                                      loading: () =>
                                          const CircularProgressIndicator(),
                                    ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                        child: videoProfilePic(
                                            'https://thrill.fun/public/uploads/profile_images/${data.data?[index].user?.avatar ?? ""}"}'),
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: Text(
                                            "@${data.data?[index].user?.username}" ??
                                                "",
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              shadows: <Shadow>[
                                                Shadow(
                                                  offset:
                                                      const Offset(0.0, 0.0),
                                                  blurRadius: 3.0,
                                                  color: Colors.black
                                                      .withOpacity(0.2),
                                                ),
                                                Shadow(
                                                  offset:
                                                      const Offset(0.0, 0.0),
                                                  blurRadius: 3.0,
                                                  color: Colors.red.shade100,
                                                ),
                                              ],
                                            ),
                                          ))
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: Text(
                                            data.data?[index].description ?? "",
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              shadows: <Shadow>[
                                                Shadow(
                                                  offset:
                                                      const Offset(0.0, 0.0),
                                                  blurRadius: 3.0,
                                                  color: Colors.black
                                                      .withOpacity(0.2),
                                                ),
                                                Shadow(
                                                  offset:
                                                      const Offset(0.0, 0.0),
                                                  blurRadius: 3.0,
                                                  color: Colors.red.shade100,
                                                ),
                                              ],
                                            ),
                                          ))
                                        ],
                                      ),
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: List.generate(
                                              data.data?[index].hashtags
                                                      ?.length ??
                                                  0,
                                              (hIndex) => Container(
                                                    padding:
                                                        const EdgeInsets.all(5),
                                                    margin:
                                                        const EdgeInsets.only(
                                                      right: 5,
                                                      top: 5,
                                                      bottom: 5,
                                                    ),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        border: Border.all(
                                                            color: Colors.red),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            offset:
                                                                const Offset(
                                                                    0.0, 0.0),
                                                            blurRadius: 1.0,
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.2),
                                                          ),
                                                          BoxShadow(
                                                            offset:
                                                                const Offset(
                                                                    0.0, 0.0),
                                                            blurRadius: 1.0,
                                                            color: Colors
                                                                .red.shade100,
                                                          ),
                                                        ]),
                                                    child: Text(
                                                      data
                                                              .data?[index]
                                                              .hashtags?[hIndex]
                                                              .name ??
                                                          '',
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Colors.white,
                                                          fontSize: 12),
                                                    ),
                                                  )),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          );
                        });
                  },
                  error: (error, _) => Center(
                        child: Text(error.toString()),
                      ),
                  loading: () => const Align(
                        child: CircularProgressIndicator(),
                      )),
              onRefresh: () async {
                return await ref.refresh(videoServiceProvider.future);
              })),
    );
  }
}

final selectedIndex = StateProvider((ref) => 0);
final isVideoInit = StateProvider((ref) => false);

class HomeVideoPLayer extends ConsumerStatefulWidget {
  const HomeVideoPLayer(this.videoData);

  final VideoDatum? videoData;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _HomeVideoPLayerState();
}

class _HomeVideoPLayerState extends ConsumerState<HomeVideoPLayer> {
  VideoPlayerController? _videoPlayerController;
  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.networkUrl(
        Uri.parse(VIDEO_URL + (widget.videoData?.video ?? "")))
      ..initialize()
      ..setLooping(true)
      ..play().then((value) {
        ref.read(isVideoInit.notifier).state = true;
        _videoPlayerController!.addListener(() {
          ref.read(videoDuration.notifier).state =
              _videoPlayerController!.value.position;
        });
      });

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _videoPlayerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(isVideoInit);

    return ref.read(isVideoInit.notifier).state == true
        ? VideoPlayer(_videoPlayerController!)
        : CachedNetworkImage(
            imageUrl:
                'https://thrillvideonew.s3.ap-south-1.amazonaws.com/gif/${widget.videoData?.gifImage}');
  }
}
