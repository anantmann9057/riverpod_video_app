import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:video_application/modal_classes/video_likes_model.dart';
import 'package:video_application/service/api_service.dart';

part 'likes_service.g.dart';
@riverpod
class LikesService extends _$LikesService{
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

  Future<VideoLikesModel> likeUnlikeVideo(int is_like)async {
    var response = await dio.post(LIKE_VIDEO,queryParameters: {
      'video_id':arg,
      'is_like':is_like
    });
    print(videoLikesModelFromMap(jsonEncode(response.data)).message);

    return videoLikesModelFromMap(jsonEncode(response.data));
  }

  Future<VideoLikesModel> getLikeStatus()async {
    var response = await dio.post(LIKE_STATUS,queryParameters: {
    'video_id':arg,
    });
    print(videoLikesModelFromMap(jsonEncode(response.data)).message);
    update((p0) => videoLikesModelFromMap(jsonEncode(response.data)));
    return videoLikesModelFromMap(jsonEncode(response.data));
  }
  @override
  FutureOr<VideoLikesModel> build(int arg) {
    return getLikeStatus();
  }
}

var videoIdProvider =StateProvider((ref) => 0);