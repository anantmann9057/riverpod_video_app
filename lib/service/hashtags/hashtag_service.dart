import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:video_application/modal_classes/hashtag_model.dart';
import 'package:video_application/service/api_service.dart';
part 'hashtag_service.g.dart';

@Riverpod(keepAlive: true)
class HashtagService extends _$HashtagService {
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
  FutureOr<List<HashtagList>> build(int arg) {
    return getHashtagList();
  }

  Future<List<HashtagList>> getHashtagList() async {
    var response = await dio.get('hashtag/list',queryParameters: {'page':arg});
    return hashtagModelFromMap(jsonEncode(response.data)).data!;
  }
}
