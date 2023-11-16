import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:video_application/modal_classes/user_videos_model.dart';
import 'package:video_application/service/api_service.dart';
part 'private_videos_service.g.dart';

@riverpod
class PrivateVideosService extends _$PrivateVideosService {
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
    return getUserPrivateVideos();
  }

  Future<UserVideosModel> getUserPrivateVideos() async {
    var response = await dio.get(USER_PRIVATE_VIDEOS);
    state = AsyncData(userVideosModelFromMap(jsonEncode(response.data)));
    return userVideosModelFromMap(jsonEncode(response.data));
  }
}
