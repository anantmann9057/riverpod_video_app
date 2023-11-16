import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:video_application/service/discover/discover_service.dart';
import 'package:video_application/service/hashtags/hashtag_service.dart';
import 'package:video_application/ui/hashtag_details_screen.dart';

class DiscoverScreen extends ConsumerWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var discoverProvider = ref.watch(discoverServiceProvider);
    var hashtagProvider = ref.watch(hashtagServiceProvider);
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          hashtagProvider.when(
              data: (hashtags) => SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: List.generate(
                            hashtags.data?.length ?? 0,
                            (index) => InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              HashtagDetailsScreen(
                                                  hashtags.data?[index].id ?? 0,
                                                  hashtags.data?[index].name),
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
                                            color:
                                                Colors.black.withOpacity(0.2),
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
                                          hashtags.data?[index].name
                                                  ?.toUpperCase() ??
                                              "",
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
              error: (error, stacktrace) => Container(),
              loading: () => const CircularProgressIndicator()),
          Expanded(
              flex: 10,
              child: ref.watch(discoverServiceProvider).when(
                  data: (discoverItem) => MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: ListView.builder(
                            itemCount: discoverItem.data?.length ?? 0,
                            itemBuilder: (context, index) => InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              HashtagDetailsScreen(
                                                  discoverItem.data?[index]
                                                          .hashtagId ??
                                                      0,
                                                  discoverItem.data?[index]
                                                      .hashtagName),
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
                                            discoverItem
                                                    .data?[index].hashtagName
                                                    ?.toUpperCase()
                                                    .replaceAll('#', '') ??
                                                '',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: Colors.red.shade400,
                                              fontSize: 18,
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
                                              discoverItem.data?[index].videos
                                                      ?.length ??
                                                  0,
                                              (videoIndex) => Container(
                                                    padding:
                                                        const EdgeInsets.all(5),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      child: Image.network(
                                                        "https://thrillvideonew.s3.ap-south-1.amazonaws.com/gif/${discoverItem.data?[index].videos?[videoIndex].gifImage}",
                                                        height: 150,
                                                        width: 150,
                                                        fit: BoxFit.cover,
                                                        errorBuilder: (context,
                                                                error,
                                                                stackTrace) =>
                                                            ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
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
                                )),
                      ),
                  error: (error, stack) => Container(
                        child: ListView(
                          children: [
                            InkWell(
                              onTap: () {
                                print(error.toString() + stack.toString());
                              },
                              child: Align(
                                alignment: Alignment.center,
                                child:
                                    Text(error.toString() + stack.toString()),
                              ),
                            )
                          ],
                        ),
                      ),
                  loading: () => const Align(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(),
                      )))
        ],
      )),
    );
  }
}
