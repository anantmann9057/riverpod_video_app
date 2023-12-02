import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:sliding_up_panel2/sliding_up_panel2.dart';
import 'package:video_application/modal_classes/video_model.dart';
import 'package:video_application/modal_classes/videos_like_model.dart';
import 'package:video_application/service/api_service.dart';
import 'package:video_application/service/authentication/authentication_service.dart';
import 'package:video_application/service/comments/comments_service.dart';
import 'package:video_application/service/likes/likes_service.dart';
import 'package:video_application/service/videos/video_service.dart';
import 'package:video_application/ui/sounds_screen.dart';
import 'package:video_application/widgets/image_widgets.dart';
import 'package:video_player/video_player.dart';

final selectedBottomIndex = StateProvider((ref) => 0);

PagingController<int, VideoDatum> pagingController =
PagingController(firstPageKey: 1);
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(selectedBottomIndex);

    var slider = ref.watch(slidingController);
    var commentId = ref.watch(commentsIdProvider);
    return Scaffold(
      body: PagedPageView<int, VideoDatum>(
        scrollDirection: Axis.vertical,
        builderDelegate: PagedChildBuilderDelegate(
          animateTransitions: true,
          firstPageProgressIndicatorBuilder: (_) => const Align(
            alignment: Alignment.center,
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          ),
          newPageProgressIndicatorBuilder: (_) => const Align(
            alignment: Alignment.center,
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          ),
          itemBuilder: (context, item, index) {
            return Container(
                height: context.height,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    item.video == null
                        ? Container(
                      color: Colors.red,
                    )
                        : HomeVideoPLayer(item),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical:
                            MediaQuery.of(context).padding.bottom + 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CachedNetworkImage(
                              imageUrl:
                              "https://thrill.fun/public/uploads/profile_images/${item.user?.avatar}",
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                              placeholder: (context, url) => const Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  CachedNetworkImage(
                                    imageUrl:
                                    "https://cdn-icons-png.flaticon.com/512/5631/5631537.png",
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            borderRadius: BorderRadius.circular(10),
                                            image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                    placeholder: (context, url) => const Align(
                                      alignment: Alignment.center,
                                      child: SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: CircularProgressIndicator(),
                                      ),
                                    ),
                                  ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "@${item.user?.username ?? ''}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                    shadows: <Shadow>[
                                      Shadow(
                                        offset: const Offset(0.0, 0.0),
                                        blurRadius: 8.0,
                                        color: Colors.black,
                                      ),
                                      Shadow(
                                        offset: const Offset(0.0, 0.0),
                                        blurRadius: 8.0,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  "${item.user?.name ??  item.user?.username?? ''}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Colors.white,
                                    shadows: <Shadow>[
                                      Shadow(
                                        offset: const Offset(0.0, 0.0),
                                        blurRadius: 8.0,
                                        color: Colors.black,
                                      ),
                                      Shadow(
                                        offset: const Offset(0.0, 0.0),
                                        blurRadius: 8.0,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical:
                            MediaQuery.of(context).padding.bottom + 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Consumer(builder: (context, ref, child) {
                              var likesProvider = ref.watch(
                                  likesServiceProvider(item.id ?? 0));
                              return likesProvider.when(
                                  data: (data) => Align(
                                    alignment: Alignment.centerRight,
                                    child: InkWell(
                                      child: data.data?.isLike == 0
                                          ? Align(
                                          alignment:
                                          Alignment.centerRight,
                                          child: Row(
                                            mainAxisSize:
                                            MainAxisSize.min,
                                            children: [
                                              Text(
                                                "${data.data?.likes ?? 0}",
                                                style:
                                                const TextStyle(
                                                  fontWeight:
                                                  FontWeight
                                                      .w700,
                                                  color:
                                                  Colors.white,
                                                  shadows: <Shadow>[
                                                    Shadow(
                                                      offset:
                                                      const Offset(
                                                          0.0,
                                                          0.0),
                                                      blurRadius:
                                                      8.0,
                                                      color: Colors
                                                          .black,
                                                    ),
                                                    Shadow(
                                                      offset:
                                                      const Offset(
                                                          0.0,
                                                          0.0),
                                                      blurRadius:
                                                      8.0,
                                                      color: Colors
                                                          .black,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                padding:
                                                const EdgeInsets
                                                    .all(10),
                                                margin:
                                                const EdgeInsets
                                                    .all(10),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(
                                                        10),
                                                    color: Colors
                                                        .red
                                                        .withOpacity(
                                                        0.5)),
                                                child: const Icon(
                                                  Icons
                                                      .favorite_border_outlined,
                                                  color:
                                                  Colors.white,
                                                  size: 16,
                                                ),
                                              ),
                                            ],
                                          ))
                                          : Align(
                                          alignment:
                                          Alignment.centerRight,
                                          child: Row(
                                            mainAxisSize:
                                            MainAxisSize.min,
                                            children: [
                                              Text(
                                                "${data.data?.likes ?? 0}",
                                                style:
                                                const TextStyle(
                                                  fontWeight:
                                                  FontWeight
                                                      .w700,
                                                  color:
                                                  Colors.white,
                                                  shadows: <Shadow>[
                                                    Shadow(
                                                      offset:
                                                      const Offset(
                                                          0.0,
                                                          0.0),
                                                      blurRadius:
                                                      8.0,
                                                      color: Colors
                                                          .black,
                                                    ),
                                                    Shadow(
                                                      offset:
                                                      const Offset(
                                                          0.0,
                                                          0.0),
                                                      blurRadius:
                                                      8.0,
                                                      color: Colors
                                                          .black,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                padding:
                                                const EdgeInsets
                                                    .all(10),
                                                margin:
                                                const EdgeInsets
                                                    .all(10),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(
                                                        10),
                                                    color: Colors
                                                        .red
                                                        .withOpacity(
                                                        0.5)),
                                                child: const Icon(
                                                  Icons
                                                      .favorite_outlined,
                                                  color:
                                                  Colors.white,
                                                  size: 16,
                                                ),
                                              ),
                                            ],
                                          )),
                                      onTap: () async {
                                        commentId = item.id ?? 0;
                                        print(commentId);
                                        await ref
                                            .watch(likesServiceProvider(
                                            item.id ?? 0)
                                            .notifier)
                                            .likeUnlikeVideo(
                                            data.data?.isLike == 0
                                                ? 1
                                                : 0)
                                            .then((value) async {
                                          await ref
                                              .watch(
                                              likesServiceProvider(
                                                  item.id ?? 0)
                                                  .notifier)
                                              .getLikeStatus();
                                        });
                                      },
                                    ),
                                  ),
                                  error: (error, stack) => Container(),
                                  loading: () => Align(
                                      alignment: Alignment.centerRight,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Text(
                                            "0",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white,
                                              shadows: <Shadow>[
                                                Shadow(
                                                  offset: const Offset(
                                                      0.0, 0.0),
                                                  blurRadius: 8.0,
                                                  color: Colors.black,
                                                ),
                                                Shadow(
                                                  offset: const Offset(
                                                      0.0, 0.0),
                                                  blurRadius: 8.0,
                                                  color: Colors.black,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            padding:
                                            const EdgeInsets.all(10),
                                            margin:
                                            const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(
                                                    10),
                                                color: Colors.red
                                                    .withOpacity(0.5)),
                                            child: const Icon(
                                              Icons
                                                  .favorite_border_outlined,
                                              color: Colors.white,
                                              size: 16,
                                            ),
                                          ),
                                        ],
                                      )));
                            }),
                            Consumer(builder: (context, ref, child) {
                              var commentsProvider = ref.watch(
                                  commentsServiceProvider(item.id ?? 0));
                              return InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder:
                                          (context) =>
                                          commentsProvider.when(
                                              data:
                                                  (comments) =>
                                                  ListView(
                                                    children: List
                                                        .generate(
                                                        comments.data?.length ??
                                                            0,
                                                            (index) =>
                                                            Padding(
                                                              padding: EdgeInsets.all(10),
                                                              child: Column(
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      CachedNetworkImage(
                                                                        imageUrl: "https://thrill.fun/public/uploads/profile_images/${comments.data?[index].avatar}",
                                                                        imageBuilder: (context, imageProvider) => Container(
                                                                          width: 45,
                                                                          height: 45,
                                                                          decoration: BoxDecoration(
                                                                            shape: BoxShape.circle,
                                                                            image: DecorationImage(image: imageProvider, fit: BoxFit.fill),
                                                                          ),
                                                                        ),
                                                                        placeholder: (context, url) => const Align(
                                                                          alignment: Alignment.center,
                                                                          child: SizedBox(
                                                                            height: 45,
                                                                            width: 45,
                                                                            child: CircularProgressIndicator(),
                                                                          ),
                                                                        ),
                                                                        errorWidget: (context, url, error) => const Icon(Icons.error),
                                                                      ),
                                                                      SizedBox(
                                                                        width: 10,
                                                                      ),
                                                                      Expanded(
                                                                          child: Text(
                                                                            comments.data?[index].name ?? "",
                                                                            style: TextStyle(fontWeight: FontWeight.w700),
                                                                          ))
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      SizedBox(
                                                                        width: 5,
                                                                      ),
                                                                      Expanded(child: Text(comments.data?[index].comment ?? ""))
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      SizedBox(
                                                                        width: 5,
                                                                      ),
                                                                      Icon(Icons.favorite_outlined),
                                                                      Text("${comments.data?[index].commentLikeCounter ?? 0}")
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                            )),
                                                  ),
                                              error: (error, stack) =>
                                                  Text(
                                                      error.toString()),
                                              loading: () =>
                                              const Align(
                                                alignment: Alignment
                                                    .center,
                                                child:
                                                CircularProgressIndicator(
                                                  color: Colors.red,
                                                ),
                                              )));
                                },
                                child: commentsProvider.when(
                                    data: (comments) => Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "${comments.data?.length ?? 0}",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white,
                                            shadows: <Shadow>[
                                              Shadow(
                                                offset: const Offset(
                                                    0.0, 0.0),
                                                blurRadius: 8.0,
                                                color: Colors.black,
                                              ),
                                              Shadow(
                                                offset: const Offset(
                                                    0.0, 0.0),
                                                blurRadius: 8.0,
                                                color: Colors.black,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding:
                                          const EdgeInsets.all(10),
                                          margin:
                                          const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(
                                                  10),
                                              color: Colors.red
                                                  .withOpacity(0.5)),
                                          child: Icon(
                                            Icons.comment,
                                            color: Colors.white,
                                            size: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                    error: (error, stack) => Container(),
                                    loading: () => Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "0",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white,
                                            shadows: <Shadow>[
                                              Shadow(
                                                offset: const Offset(
                                                    0.0, 0.0),
                                                blurRadius: 8.0,
                                                color: Colors.black,
                                              ),
                                              Shadow(
                                                offset: const Offset(
                                                    0.0, 0.0),
                                                blurRadius: 8.0,
                                                color: Colors.black,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding:
                                          const EdgeInsets.all(10),
                                          margin:
                                          const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(
                                                  10),
                                              color: Colors.red
                                                  .withOpacity(0.5)),
                                          child: Icon(
                                            Icons.comment,
                                            color: Colors.white,
                                            size: 16,
                                          ),
                                        ),
                                      ],
                                    )),
                              );
                            }),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  item.sound ?? "",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                    shadows: <Shadow>[
                                      Shadow(
                                        offset: const Offset(0.0, 0.0),
                                        blurRadius: 8.0,
                                        color: Colors.black,
                                      ),
                                      Shadow(
                                        offset: const Offset(0.0, 0.0),
                                        blurRadius: 8.0,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 5,),
                                CachedNetworkImage(
                                  imageUrl:
                                  "https://static.vecteezy.com/system/resources/previews/002/158/954/non_2x/neon-composition-of-digital-sound-wave-abstract-illustration-of-neon-music-wave-shape-wavy-motion-glowing-line-pulsating-audio-track-isolated-outline-icon-symbol-blue-pink-gradient-isolated-on-brick-wall-vector.jpg",
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                        width: 38,
                                        height: 38,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                  placeholder: (context, url) =>
                                  const Align(
                                    alignment: Alignment.center,
                                    child: SizedBox(
                                      height: 30,
                                      width: 30,
                                      child: CircularProgressIndicator(),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      CachedNetworkImage(
                                        imageUrl:
                                        "https://cdn-icons-png.flaticon.com/512/5631/5631537.png",
                                        imageBuilder:
                                            (context, imageProvider) =>
                                            Container(
                                              width: 38,
                                              height: 38,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.rectangle,
                                                borderRadius:
                                                BorderRadius.circular(10),
                                                image: DecorationImage(
                                                    image: imageProvider,
                                                    fit: BoxFit.cover),
                                              ),
                                            ),
                                        placeholder: (context, url) =>
                                        const Align(
                                          alignment: Alignment.center,
                                          child: SizedBox(
                                            height: 30,
                                            width: 30,
                                            child: CircularProgressIndicator(),
                                          ),
                                        ),
                                      ),
                                ),
                                SizedBox(width: 10,)
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ));
          },
        ),
        pagingController: pagingController
          ..addPageRequestListener((pageKey) async {
            try {
              final newItems = await ref
                  .read(videoServiceProvider(pageKey).notifier)
                  .getAllVideos();
              final isLastPage = newItems.length < 7;
              if (isLastPage) {
                pagingController.appendLastPage(newItems);
              } else {
                final nextPageKey = pageKey + 1;
                pagingController.appendPage(newItems, nextPageKey);
              }
            } catch (error, stack) {
              pagingController.error = error;
              print(error);
              print(stack);
            }
          }),
      ),
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
      ..setLooping(true)
      ..initialize().then((value) {
        setState(() {
          _videoPlayerController?.play();
        });
        ref.read(isVideoInit.notifier).state = true;
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
    var isInit = ref.watch(isVideoInit);

    return isInit == true
        ? AspectRatio(
            aspectRatio: _videoPlayerController!.value.aspectRatio,
            child: VideoPlayer(_videoPlayerController!),
          )
        : const Align(
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          );
  }
}
