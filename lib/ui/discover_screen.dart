import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:video_application/modal_classes/hashtag_model.dart';
import 'package:video_application/service/discover/discover_service.dart';
import 'package:video_application/service/hashtags/hashtag_service.dart';
import 'package:video_application/ui/hashtag_details_screen.dart';

import '../modal_classes/top_hashtag_videos.dart';

PagingController<int, HashtagList> pagingController =
PagingController(firstPageKey: 1);

PagingController<int, TopHashtags> hashtagVideosPageController =
PagingController(firstPageKey: 1);

class DiscoverScreen extends ConsumerWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 80,
            child: PagedListView<int, HashtagList>(
                scrollDirection: Axis.horizontal,
                pagingController: pagingController
                  ..addPageRequestListener((pageKey) async {
                    try {
                      final newItems = await ref
                          .read(hashtagServiceProvider(pageKey).notifier)
                          .getHashtagList();
                      final isLastPage = newItems.length < 6;
                      if (isLastPage) {
                        pagingController.appendLastPage(newItems);
                      } else {
                        final nextPageKey = pageKey + 1;
                        pagingController.appendPage(newItems, nextPageKey);
                      }
                    } catch (error,stack) {
                      pagingController.error = error;
                      print(error);
                      print(stack);
                    }
                  }),
                builderDelegate: PagedChildBuilderDelegate(
                    itemBuilder: (context, item, index) => InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HashtagDetailsScreen(
                                      item.id ?? 0, item.name),
                                ));
                          },
                          child: Container(
                            width: 80,
                            height: 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.red),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    offset: const Offset(0.0, 0.0),
                                    blurRadius: 1.0,
                                    color: Colors.black.withOpacity(0.2),
                                  ),
                                  BoxShadow(
                                    offset: const Offset(0.0, 0.0),
                                    blurRadius: 1.0,
                                    color: const Color.fromARGB(
                                        255, 248, 213, 217),
                                  ),
                                ]),
                            margin: const EdgeInsets.all(5),
                            padding: const EdgeInsets.all(5),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                    child: Text(
                                  item.name?.toUpperCase() ?? "",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                      fontSize: 10),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                ))
                              ],
                            ),
                          ),
                        ))),
          ),
          Expanded(
              flex: 10,
              child: SizedBox(
                height: 400,
                child: PagedListView<int, TopHashtags>(
                    scrollDirection: Axis.vertical,
                    pagingController: hashtagVideosPageController
                      ..addPageRequestListener((pageKey) async {
                        try {
                          final newItems = await ref
                              .read(discoverServiceProvider(pageKey).notifier)
                              .getVideosofTopHashtags();
                          final isLastPage = newItems.length < 6;
                          if (isLastPage) {
                            hashtagVideosPageController
                                .appendLastPage(newItems);
                          } else {
                            final nextPageKey = pageKey + 1;
                            hashtagVideosPageController.appendPage(
                                newItems, nextPageKey);
                          }
                        } catch (error) {
                          hashtagVideosPageController.error = error;
                        }
                      }),
                    builderDelegate: PagedChildBuilderDelegate(
                        itemBuilder: (context, item, index) => InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          HashtagDetailsScreen(
                                              item.hashtagId ?? 0,
                                              item.hashtagName),
                                    ));
                              },
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      ClipOval(
                                        child: Container(
                                          color: Colors.red.shade300
                                              .withOpacity(0.2),
                                          child: const Icon(
                                            Icons.numbers,
                                            size: 35,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Expanded(
                                          child: Text(
                                        item.hashtagName
                                                ?.toUpperCase()
                                                .replaceAll('#', '') ??
                                            '',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.red.shade400,
                                          fontSize: 18,
                                          shadows: <Shadow>[
                                            Shadow(
                                              offset: const Offset(0.0, 0.0),
                                              blurRadius: 3.0,
                                              color:
                                                  Colors.black.withOpacity(0.2),
                                            ),
                                            Shadow(
                                              offset: const Offset(0.0, 0.0),
                                              blurRadius: 8.0,
                                              color: Colors.red.shade100,
                                            ),
                                          ],
                                        ),
                                      ))
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: List.generate(
                                          item.videos?.length ?? 0,
                                          (videoIndex) => Container(
                                                padding:
                                                    const EdgeInsets.all(5),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: Image.network(
                                                    "https://thrillvideonew.s3.ap-south-1.amazonaws.com/gif/${item.videos?[videoIndex].gifImage}",
                                                    height: 150,
                                                    width: 150,
                                                    fit: BoxFit.cover,
                                                    errorBuilder: (context,
                                                            error,
                                                            stackTrace) =>
                                                        ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      child: Image.network(
                                                        "https://t3.ftcdn.net/jpg/04/62/93/66/360_F_462936689_BpEEcxfgMuYPfTaIAOC1tCDurmsno7Sp.jpg",
                                                        height: 150,
                                                        width: 150,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )),
                                    ),
                                  )
                                ],
                              ),
                            ))),
              )),
        ],
      )),
    );
  }
}
