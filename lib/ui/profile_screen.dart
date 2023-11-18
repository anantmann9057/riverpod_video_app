import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/utils.dart';
import 'package:get_storage/get_storage.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';
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

import '../service/profile/profile_videos/user_videos_notifier.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var profileVideos = ref.watch(userVideosServiceProvider);
    var privateVideos = ref.watch(privateVideosServiceProvider);
    var profileProvider = ref.watch(profileServiceProvider);

    var isLogin = ref.watch(authNotiferProvider);
    UserModel userLoginModel =
        UserModel.fromJson(jsonDecode(GetStorage().read('user')));

    var likedVideosProvider = ref
        .watch(likedVideosServiceProvider(userLoginModel.data?.user?.id ?? 0));
    return DefaultTabController(
        length: isLogin == AuthState.Authenticated ? 3 : 2,
        child: Scaffold(
          body: SafeArea(
              child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              height: context.height,
              width: context.width,
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  CachedNetworkImage(
                    imageUrl:
                        "https://thrill.fun/public/uploads/profile_images/${userLoginModel.data?.user?.avatar}",
                    imageBuilder: (context, imageProvider) => Container(
                      width: 150,
                      height: 150,
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
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    userLoginModel.data?.user?.name ??
                        userLoginModel.data?.user?.username ??
                        "",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "@ ${userLoginModel.data?.user?.username ?? ""}",
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          userLoginModel.data?.user?.bio ?? "",
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TabBar(
                    tabs: [
                      const Tab(icon: Icon(Icons.person_2)),
                      const Tab(icon: Icon(Icons.lock)),
                      const Tab(icon: Icon(Icons.favorite)),
                    ],
                  ),
                  Expanded(
                      child: TabBarView(
                    children: [
                      RiverPagedBuilder<int, Datum>(
                        firstPageKey: 0,
                        limit: 9,
                        provider: userVideoProvider,
                        itemBuilder: (context, item, index) => CachedNetworkImage(
                          imageUrl:
                          'https://thrillvideonew.s3.ap-south-1.amazonaws.com/gif/${item.gifImage}',
                          imageBuilder:
                              (context, imageProvider) =>
                              Container(
                                width: context.width / 3,
                                height: context.height / 3,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover),
                                ),
                              ),
                          placeholder: (context, url) =>
                          const Align(
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
                        ),
                        pagedBuilder: (controller, builder) => PagedGridView(
                          pagingController: controller,
                          builderDelegate: builder,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                          ),
                        ),
                      ),

                      privateVideos.when(
                          data: (data) => privateVideos.isLoading ||
                                  privateVideos.isRefreshing ||
                                  privateVideos.isReloading
                              ? const Align(
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: CircularProgressIndicator(),
                                  ),
                                )
                              : GridView.builder(
                                  itemCount: data.data?.length,
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          crossAxisSpacing: 5,
                                          mainAxisSpacing: 5),
                                  itemBuilder: (context, index) =>
                                      CachedNetworkImage(
                                        imageUrl:
                                            'https://thrillvideonew.s3.ap-south-1.amazonaws.com/gif/${data.data?[index].gifImage}',
                                        imageBuilder:
                                            (context, imageProvider) =>
                                                Container(
                                          width: context.width / 3,
                                          height: context.height / 3,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                        placeholder: (context, url) =>
                                            const Align(
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
                                      )),
                          error: (error, trace) =>
                              Text(error.toString() + trace.toString()),
                          loading: () => const Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: CircularProgressIndicator(),
                                ),
                              )),
                      likedVideosProvider.when(
                          data: (data) => likedVideosProvider.isLoading ||
                                  likedVideosProvider.isRefreshing ||
                                  likedVideosProvider.isReloading
                              ? const Align(
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: CircularProgressIndicator(),
                                  ),
                                )
                              : GridView.builder(
                                  itemCount: data.data?.length,
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          crossAxisSpacing: 5,
                                          mainAxisSpacing: 5),
                                  itemBuilder: (context, index) =>
                                      CachedNetworkImage(
                                        imageUrl:
                                            'https://thrillvideonew.s3.ap-south-1.amazonaws.com/gif/${data.data?[index].gifImage}',
                                        imageBuilder:
                                            (context, imageProvider) =>
                                                Container(
                                          width: context.width / 3,
                                          height: context.height / 3,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                        placeholder: (context, url) =>
                                            const Align(
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
                                      )),
                          error: (error, trace) =>
                              Text(error.toString() + trace.toString()),
                          loading: () => const Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: CircularProgressIndicator(),
                                ),
                              ))
                    ],
                  ))
                ],
              ),
            ),
          )),
        ));
  }
}
