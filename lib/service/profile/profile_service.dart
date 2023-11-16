import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:video_application/modal_classes/user_videos_model.dart';
import 'package:video_application/modal_classes/video_model.dart';
import 'package:video_application/service/api_service.dart';
part 'profile_service.g.dart';

@Riverpod(keepAlive: true)
class ProfileService extends _$ProfileService {
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

  Future<UserVideosModel> getProfileVideos() async {
    var response = await dio.post(USER_VIDEOS);
    state = AsyncData(userVideosModelFromMap(jsonEncode(response.data)));
    return userVideosModelFromMap(jsonEncode(response.data));
  }

  @override
  FutureOr<UserVideosModel> build() {
    return getProfileVideos();
  }
}
