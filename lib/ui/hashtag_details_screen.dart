// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:video_application/service/discover/discover_service.dart';
import 'package:video_application/service/hashtags/hashtag_service.dart';
import 'package:video_application/service/hashtags/hashtag_videos_service.dart';

class HashtagDetailsScreen extends ConsumerWidget {
  HashtagDetailsScreen(this.hashtagId, this.hashtagName, {super.key});

  int? hashtagId;
  String? hashtagName;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var hashtagProvider =
        ref.watch(hashtagVideosServiceProvider(hashtagId ?? 0));
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
                    )
                  ],
                ),
              )
            ],
          ),
          Expanded(
              child: hashtagProvider.when(
                  data: (data) => GridView.builder(
                      itemCount: data.data?.length ?? 0,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5),
                      itemBuilder: (context, index) => CachedNetworkImage(
                            imageUrl:
                                "https://thrillvideonew.s3.ap-south-1.amazonaws.com/gif/${data.data?[index].gifImage}",
                            fit: BoxFit.cover,
                          )),
                  error: (error, trace) {
                    print(error);
                    print(trace);
                    return Text(error.toString() + trace.toString());
                  },
                  loading: () => const Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          height: 50,
                          width: 50,
                          child: CircularProgressIndicator(),
                        ),
                      )))
        ],
      )),
    );
  }
}
