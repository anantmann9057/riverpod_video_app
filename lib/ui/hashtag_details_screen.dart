// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:video_application/service/discover/discover_service.dart';
import 'package:video_application/service/hashtags/hashtag_service.dart';
import 'package:video_application/service/hashtags/hashtag_videos_service.dart';

import '../modal_classes/hashtag_video_model.dart';

class HashtagDetailsScreen extends ConsumerWidget {
  HashtagDetailsScreen(this.hashtagId, this.hashtagName, {super.key});

  int? hashtagId;
  String? hashtagName;
  PagingController<int, Datum> hashtagVideosPageController =
      PagingController(firstPageKey: 1);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.red.shade400),
                      child: const Icon(
                        Icons.numbers,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                    Text(
                      hashtagName ?? "",
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      hashtagName ?? "",
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              )
            ],
          ),
          Expanded(
              child: PagedGridView<int, Datum>(
                  pagingController: hashtagVideosPageController
                    ..addPageRequestListener((pageKey) async {
                      try {
                        final newItems = await ref
                            .read(hashtagVideosServiceProvider(hashtagId ?? 0)
                                .notifier)
                            .getHashtagById(pageKey);
                        final isLastPage = newItems.length < 6;
                        if (isLastPage) {
                          hashtagVideosPageController.appendLastPage(newItems);
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
                      itemBuilder: (context, item, index) => CachedNetworkImage(
                            imageUrl:
                                "https://thrillvideonew.s3.ap-south-1.amazonaws.com/gif/${item.gifImage}",
                            fit: BoxFit.cover,
                            errorWidget: (context, url, error) =>
                                CachedNetworkImage(
                                    imageUrl:
                                        "https://t3.ftcdn.net/jpg/04/62/93/66/360_F_462936689_BpEEcxfgMuYPfTaIAOC1tCDurmsno7Sp.jpg"),
                          )),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3)))
        ],
      )),
    );
  }
}
