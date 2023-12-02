import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:video_application/modal_classes/user_videos_model.dart';
import 'package:video_application/service/api_service.dart';
part 'liked_videos_service.g.dart';

@riverpod
class LikedVideosService extends _$LikedVideosService{
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
    return getUserLikedVideos();
  }

  Future<List<UserVideos>> getUserLikedVideos() async {
    var response =
        await dio.post(USER_LIKED_VIDEOS, queryParameters: {'page':arg});
    return userVideosModelFromMap(jsonEncode(response.data)).data;
  }
}
