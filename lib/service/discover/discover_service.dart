import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:video_application/modal_classes/hashtag_model.dart';
import 'package:video_application/modal_classes/top_hashtag_videos.dart';
import 'package:video_application/service/api_service.dart';
part 'discover_service.g.dart';

@Riverpod(keepAlive: true)
class DiscoverService extends _$DiscoverService {
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

  Future<List<TopHashtags>> getVideosofTopHashtags() async {
    var response = await dio.get('hashtag/top-hashtags-videos',queryParameters: {'page':arg});
    return TopHashtagVideos.fromJson(jsonDecode(jsonEncode(response.data))).data!;
  }

  @override
  FutureOr<List<TopHashtags>> build(int arg) {
    return getVideosofTopHashtags();
  }
}
