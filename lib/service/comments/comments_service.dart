import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:video_application/modal_classes/comments_model.dart';
import 'package:video_application/service/api_service.dart';
part 'comments_service.g.dart';

@riverpod
class CommentsService extends _$CommentsService {
  int? videoId;
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
  FutureOr<CommentsModel> build(int arg) {
    return getComments();
  }

  Future<CommentsModel> getComments() async {
    var response =
        await dio.post(VIDEO_COMMENTS, queryParameters: {'video_id': arg});
    return commentsModelFromMap(jsonEncode(response.data));
  }
}

var commentsIdProvider = StateProvider((ref) => 0);

