import 'dart:async';
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:video_application/modal_classes/user_videos_model.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:video_application/modal_classes/user_videos_model.dart';
import 'package:video_application/modal_classes/video_model.dart';
import 'package:video_application/service/api_service.dart';

part 'user_videos_service.g.dart';

@Riverpod(keepAlive: true)
class UserVideosService extends _$UserVideosService {
  var dio = Dio(BaseOptions(
      baseUrl: 'https://thrill.fun/api/',
      headers: {
        'Authorization': 'Bearer ${GetStorage().read('token')} ',
        "Accept": "application/json"
      },
      followRedirects: false,
      validateStatus: (status) {
        return status! < 500;
      }));

  @override
  FutureOr<List<UserVideos>> build(int arg) {
    return getProfileVideos();
  }

  Future<List<UserVideos>> getProfileVideos() async {
    var response = await dio
        .post(USER_VIDEOS, queryParameters: {'page': arg});
    ref.read(currentPageNotifier.notifier).state =
        userVideosModelFromMap(jsonEncode(response.data))
                .pagination
                ?.currentPage ??
            1;
    ref.read(nextPageUrlProvider.notifier).state =
        userVideosModelFromMap(jsonEncode(response.data))
                .pagination
                ?.nextPageUrl ??
            '';
    return userVideosModelFromMap(jsonEncode(response.data)).data;
  }
}

var currentPageNotifier = StateProvider((ref) => 1);

var pagingControllerProvider = StateProvider((ref) {
  var currentPage = ref.read(currentPageNotifier);
  return PagingController<int, UserVideos>(firstPageKey: currentPage);
});

var nextPageUrlProvider = StateProvider((ref) => '');
