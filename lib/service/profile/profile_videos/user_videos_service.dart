import 'dart:async';
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_application/modal_classes/user_videos_model.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:video_application/modal_classes/user_videos_model.dart';
import 'package:video_application/modal_classes/video_model.dart';
import 'package:video_application/service/api_service.dart';
part 'user_videos_service.g.dart';

@riverpod
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
  FutureOr<UserVideosModel> build() {
    return getProfileVideos();
  }

  Future<UserVideosModel> getProfileVideos() async {
    var response = await dio.post(USER_VIDEOS);
    state = AsyncData(userVideosModelFromMap(jsonEncode(response.data)));
    return userVideosModelFromMap(jsonEncode(response.data));
  }
}
