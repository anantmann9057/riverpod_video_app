import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:video_application/modal_classes/selected_sound_model.dart';
import 'package:video_application/modal_classes/sounds_model.dart';
import 'package:video_application/service/api_service.dart';
part 'selected_sound_service.g.dart';

@riverpod
class SelectedSoundService extends _$SelectedSoundService {
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
  FutureOr<SelectedSoundModel> build(int arg) {
    return getSoundById();
  }

  Future<SelectedSoundModel> getSoundById() async {
    var response = await dio.post(GET_SOUND, queryParameters: {'id': arg});

    return selectedSoundModelFromMap(jsonEncode(response.data));
  }
}
