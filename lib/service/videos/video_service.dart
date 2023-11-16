import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:video_application/modal_classes/comments_model.dart';
import 'package:video_application/modal_classes/video_model.dart';
import 'package:video_application/modal_classes/videos_like_model.dart';
import 'package:video_application/service/api_service.dart';
import 'package:video_application/service/comments/comments_service.dart';
part 'video_service.g.dart';

@Riverpod(keepAlive: true)
class VideoService extends _$VideoService {
  var dio = Dio(BaseOptions(baseUrl: BASE_URL, headers: {
    'Authorization':
        'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYzc2MGQxZjdhNDcyMTM0NmViMTZjYmM3NDc4OWYzODgxOTFjZDIyNzEwNTkwMjE5M2FlNWNiMzk0ZGQxMTg4YWRlNjcwZmI1NTA4OWI1MGEiLCJpYXQiOjE2OTAzNTI2NDkuNDM3NDQzMDE3OTU5NTk0NzI2NTYyNSwibmJmIjoxNjkwMzUyNjQ5LjQzNzQ0Mzk3MTYzMzkxMTEzMjgxMjUsImV4cCI6MTcyMTk3NTA0OS40MzQ2ODY4OTkxODUxODA2NjQwNjI1LCJzdWIiOiI2MCIsInNjb3BlcyI6W119.IL7t1NNVuDE7eanE7hLZfpxp7cqLK-ORAHIKZgK0BswrovGExsBFE_9tJFEyJR4WvbsaakRY0BZTIbA9t1xPEfVhDJZsvvZ-UnP49bcTXAY75edktvIIilRhR-J4QtYfhAUtHF673kznsjvPKNnlJX1MJsyyJRAgDtOulvJEMQG-3ziKumqSaxAQUvLUg5Qjm-YShTPzrzGQ9miAD53GrbndwWwgT8X9jp5j3DyvQKFfdrVXtXutKeDkJA_SgiEuqyFgO38lXGGYaSPNsLZyVs871GdoML66u2-fq7yNBT45cu0Eq0bB50ddwIzNsqzAs9OVUq1Pa_b46caE1N3mRYihr6roIM535kriJCK-e5ov8Ucj7ym32dYaIDdP6U9uNMFieYSZW6mZqbKudZRpN6QwDU4E7t2TbNpPLmPqfnvmhavhjnMBP_MQybvJti7UmyS6iHIMCssZtq_c6MNtRgy_jFYaHUiSzVcpojoI-3M8gnw5fQVrvnbP6rYBUuKrkHmdCBju2L4twyahYrRbbXuHA07pm-ecJ1Pb8AIieYj2j-E5OSwSP2gVx8It8tCyMIZWqm--p3p3v9OzUHV0zK5wrLdRGQvsv-iDBeOiJzdMynRR3FLFi6Zic_WPfs72LRszhVWDgrdqQ4zjX8cbtpgb2KqwbLl5Nio5M2WGZ3w'
  }));
  @override
  FutureOr<VideosModel> build() {
    return getAllVideos();
  }

  Future<VideosModel> getAllVideos({int page = 1}) async {
    var response = await dio.get(VIDEO_LIST, queryParameters: {'page': page});
    getComments(
        videosModelFromMap(jsonEncode(response.data)).data!.first.id ?? 0);

    return videosModelFromMap(jsonEncode(response.data));
  }

  Future<VideoLikeModel> getLikes(int id) async {
    var response =
        await dio.post(VIDEO_LIKE, queryParameters: {"video_id": id});
    return videoLikeModelFromMap(jsonEncode(response.data));
  }

  Future<VideoLikeModel> likeVideo(int video_id, int is_like) async {
    var response = await dio.post('video/like',
        queryParameters: {"video_id": video_id, "is_like": is_like});

    return videoLikeModelFromMap(jsonEncode(response.data));
  }

  Future<CommentsModel> getComments(int video_id) async {
    var response =
        await dio.post(VIDEO_COMMENTS, queryParameters: {'video_id': video_id});
    return commentsModelFromMap(jsonEncode(response.data));
  }
}

final isLikeProvider = StateProvider<bool>((ref) => false);
final totalLikesProvider = StateProvider((ref) => 0);

final videoDuration = StateProvider((ref) => Duration(seconds: 0));
