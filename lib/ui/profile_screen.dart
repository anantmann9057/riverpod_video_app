import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/utils.dart';
import 'package:get_storage/get_storage.dart';
import 'package:video_application/main.dart';
import 'package:video_application/modal_classes/user_login_model.dart';
import 'package:video_application/modal_classes/user_model.dart';
import 'package:video_application/modal_classes/user_videos_model.dart';
import 'package:video_application/service/authentication/auth_notifier.dart';
import 'package:video_application/service/authentication/auth_state.dart';
import 'package:video_application/service/profile/like_videos/liked_videos_service.dart';
import 'package:video_application/service/profile/private_videos/private_videos_service.dart';
import 'package:video_application/service/profile/profile_service.dart';
import 'package:get/get.dart';
import 'package:video_application/service/profile/profile_videos/user_videos_service.dart';

import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:video_application/ui/home_screen.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var isLogin = ref.watch(authNotiferProvider);
    UserModel userLoginModel =
        UserModel.fromJson(jsonDecode(GetStorage().read('user')));

    PagingController<int, UserVideos> pagingController =
        PagingController(firstPageKey: 1, invisibleItemsThreshold: 3);
    PagingController<int, UserVideos> privatePagingController =
        PagingController(firstPageKey: 1);
    PagingController<int, UserVideos> likedPagingController =
        PagingController(firstPageKey: 1);
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(title: Text(userLoginModel.data?.user?.name??""),),
          body: SafeArea(
              child: Column(
            children: [
             Padding(padding: EdgeInsets.all(10),child:  Row(
               children: [
                 InkWell(
                   onTap: () async {
                     await ref
                         .watch(authNotiferProvider.notifier)
                         .signOutUser()
                         .then((value) {
                       ref.watch(selectedIndex.notifier).state = 0;
                       ref.watch(selectedBottomIndex.notifier).state = 0;
                       ref.watch(selectedScreen.notifier).state = 0;
                     });
                   },
                   child: CachedNetworkImage(
                     imageUrl:
                     "https://thrill.fun/public/uploads/profile_images/${userLoginModel.data?.user?.avatar}",
                     imageBuilder: (context, imageProvider) => Container(
                       width: 80,
                       height: 80,
                       decoration: BoxDecoration(
                         shape: BoxShape.circle,
                         image: DecorationImage(
                             image: imageProvider, fit: BoxFit.fill),
                       ),
                     ),
                     placeholder: (context, url) => const Align(
                       alignment: Alignment.center,
                       child: SizedBox(
                         height: 50,
                         width: 50,
                         child: CircularProgressIndicator(),
                       ),
                     ),
                     errorWidget: (context, url, error) =>
                     const Icon(Icons.error),
                   ),
                 ),
                 SizedBox(
                   width: 10,
                 ),
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text(
                       userLoginModel.data?.user?.name ??
                           userLoginModel.data?.user?.username ??
                           "",
                       style: const TextStyle(
                           fontSize: 18, fontWeight: FontWeight.w700),
                     ),
                     const SizedBox(
                       height: 5,
                     ),
                     Text(
                       userLoginModel.data?.user?.bio ?? "",
                       overflow: TextOverflow.ellipsis,
                       style: const TextStyle(
                           fontSize: 14, fontWeight: FontWeight.w400),
                     )
                   ],
                 ),
               ],
             ),),

              const TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.person_2)),
                  Tab(icon: Icon(Icons.lock)),
                  Tab(icon: Icon(Icons.favorite)),
                ],
              ),
              Expanded(
                  child: TabBarView(children: [
                PagedMasonryGridView<int, UserVideos>.count(
                  mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      pagingController: pagingController
                      ..addPageRequestListener((pageKey) async {
                        try {
                          final newItems = await ref
                              .watch(userVideosServiceProvider(pageKey)
                                  .notifier)
                              .getProfileVideos();
                          final isLastPage = newItems.length < 7;
                          if (isLastPage) {
                            pagingController.appendLastPage(newItems);
                          } else {
                            final nextPageKey = pageKey + 1;
                            pagingController.appendPage(
                                newItems, nextPageKey);
                          }
                        } catch (error) {
                          pagingController.error = error;
                        }

                      }),
                    builderDelegate: PagedChildBuilderDelegate(
                        itemBuilder: (context, item, index) =>
                            CachedNetworkImage(

                              imageUrl:
                                  'https://thrillvideonew.s3.ap-south-1.amazonaws.com/gif/${item.gifImage}',
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                    height: context.height/4.5,
                                    width: context.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover),
                                ),
                              ),
                              placeholder: (context, url) => const Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  CachedNetworkImage(
                                      imageUrl:
                                          'https://icons.veryicon.com/png/o/education-technology/alibaba-big-data-oneui/image-loading-failed-02.png'),
                            )), crossAxisCount: 3,),
                Expanded(
                    child: PagedGridView<int, UserVideos>(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,crossAxisSpacing: 5,mainAxisSpacing: 5,childAspectRatio: 0.7 ),
                        pagingController: privatePagingController
                          ..addPageRequestListener((pageKey) async {
                            try {
                              final newItems = await ref
                                  .read(privateVideosServiceProvider(pageKey)
                                      .notifier)
                                  .getUserPrivateVideos();
                              final isLastPage = newItems.length < 7;
                              if (isLastPage) {
                                privatePagingController
                                    .appendLastPage(newItems);
                              } else {
                                final nextPageKey = pageKey + 1;
                                privatePagingController.appendPage(
                                    newItems, nextPageKey);
                              }
                            } catch (error) {
                              privatePagingController.error = error;
                            }
                            // print(pageKey);
                            //
                            // var newItems = await ref
                            //     .read(userVideosServiceProvider(1).notifier)
                            //     .getProfileVideos(2);
                            //
                            // if (newItems.isNotEmpty) {
                            //   pagingController.appendPage(newItems, pageKey);
                            // }
                          }),
                        builderDelegate: PagedChildBuilderDelegate(
                            itemBuilder: (context, item, index) =>
                                CachedNetworkImage(
                                  imageUrl:
                                      'https://thrillvideonew.s3.ap-south-1.amazonaws.com/gif/${item.gifImage}',
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    width: context.width / 3,
                                    height: context.height / 3,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  placeholder: (context, url) => const Align(
                                    alignment: Alignment.center,
                                    child: SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: CircularProgressIndicator(),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      CachedNetworkImage(
                                          imageUrl:
                                              'https://icons.veryicon.com/png/o/education-technology/alibaba-big-data-oneui/image-loading-failed-02.png'),
                                )))),
                Expanded(
                    child: PagedGridView<int, UserVideos>(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,crossAxisSpacing: 5,mainAxisSpacing: 5,childAspectRatio: 0.7 ),
                        pagingController: likedPagingController
                          ..addPageRequestListener((pageKey) async {
                            try {
                              final newItems = await ref
                                  .watch(likedVideosServiceProvider(pageKey)
                                      .notifier)
                                  .getUserLikedVideos();
                              final isLastPage = newItems.length < 7;
                              if (isLastPage) {
                                likedPagingController.appendLastPage(newItems);
                              } else {
                                final nextPageKey = pageKey + 1;
                                likedPagingController.appendPage(
                                    newItems, nextPageKey);
                              }
                            } catch (error) {
                              likedPagingController.error = error;
                            }
                            // print(pageKey);
                            //
                            // var newItems = await ref
                            //     .read(userVideosServiceProvider(1).notifier)
                            //     .getProfileVideos(2);
                            //
                            // if (newItems.isNotEmpty) {
                            //   pagingController.appendPage(newItems, pageKey);
                            // }
                          }),
                        builderDelegate: PagedChildBuilderDelegate(
                            itemBuilder: (context, item, index) =>
                                CachedNetworkImage(
                                  imageUrl:
                                      'https://thrillvideonew.s3.ap-south-1.amazonaws.com/gif/${item.gifImage}',
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    width: context.width / 3,
                                    height: context.height / 3,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  placeholder: (context, url) => const Align(
                                    alignment: Alignment.center,
                                    child: SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: CircularProgressIndicator(),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      CachedNetworkImage(
                                          imageUrl:
                                              'https://icons.veryicon.com/png/o/education-technology/alibaba-big-data-oneui/image-loading-failed-02.png'),
                                ))))
              ]))
            ],
          )),
        ));
  }
}
