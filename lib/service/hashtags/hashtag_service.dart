import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:video_application/modal_classes/hashtag_model.dart';
import 'package:video_application/service/api_service.dart';
part 'hashtag_service.g.dart';

@Riverpod(keepAlive: true)
class HashtagService extends _$HashtagService {
  var dio = Dio(BaseOptions(baseUrl: BASE_URL, headers: {
    'Authorization':
        'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYzc2MGQxZjdhNDcyMTM0NmViMTZjYmM3NDc4OWYzODgxOTFjZDIyNzEwNTkwMjE5M2FlNWNiMzk0ZGQxMTg4YWRlNjcwZmI1NTA4OWI1MGEiLCJpYXQiOjE2OTAzNTI2NDkuNDM3NDQzMDE3OTU5NTk0NzI2NTYyNSwibmJmIjoxNjkwMzUyNjQ5LjQzNzQ0Mzk3MTYzMzkxMTEzMjgxMjUsImV4cCI6MTcyMTk3NTA0OS40MzQ2ODY4OTkxODUxODA2NjQwNjI1LCJzdWIiOiI2MCIsInNjb3BlcyI6W119.IL7t1NNVuDE7eanE7hLZfpxp7cqLK-ORAHIKZgK0BswrovGExsBFE_9tJFEyJR4WvbsaakRY0BZTIbA9t1xPEfVhDJZsvvZ-UnP49bcTXAY75edktvIIilRhR-J4QtYfhAUtHF673kznsjvPKNnlJX1MJsyyJRAgDtOulvJEMQG-3ziKumqSaxAQUvLUg5Qjm-YShTPzrzGQ9miAD53GrbndwWwgT8X9jp5j3DyvQKFfdrVXtXutKeDkJA_SgiEuqyFgO38lXGGYaSPNsLZyVs871GdoML66u2-fq7yNBT45cu0Eq0bB50ddwIzNsqzAs9OVUq1Pa_b46caE1N3mRYihr6roIM535kriJCK-e5ov8Ucj7ym32dYaIDdP6U9uNMFieYSZW6mZqbKudZRpN6QwDU4E7t2TbNpPLmPqfnvmhavhjnMBP_MQybvJti7UmyS6iHIMCssZtq_c6MNtRgy_jFYaHUiSzVcpojoI-3M8gnw5fQVrvnbP6rYBUuKrkHmdCBju2L4twyahYrRbbXuHA07pm-ecJ1Pb8AIieYj2j-E5OSwSP2gVx8It8tCyMIZWqm--p3p3v9OzUHV0zK5wrLdRGQvsv-iDBeOiJzdMynRR3FLFi6Zic_WPfs72LRszhVWDgrdqQ4zjX8cbtpgb2KqwbLl5Nio5M2WGZ3w'
  }));
  @override
  FutureOr<HashtagModel> build() {
    return getHashtagList();
  }

  Future<HashtagModel> getHashtagList() async {
    var response = await dio.get('hashtag/list');
    return hashtagModelFromMap(jsonEncode(response.data));
  }
}
