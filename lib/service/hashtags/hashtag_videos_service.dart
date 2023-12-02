import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:video_application/modal_classes/hashtag_video_model.dart';
import 'package:video_application/service/api_service.dart';
part 'hashtag_videos_service.g.dart';

@Riverpod(keepAlive: true)
class HashtagVideosService extends _$HashtagVideosService {
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
  FutureOr<List<Datum>> build(int arg) {
    return getHashtagById(1);
  }

  Future<List<Datum>> getHashtagById(int page) async {
    var response = await dio
        .post(HASHTAG_BY_ID, queryParameters: {'hashtag_id': arg,"page":page});
    return hashtagVideosModelFromMap(jsonEncode(response.data)).data??[];
  }
}
