import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:video_application/modal_classes/sounds_model.dart';
import 'package:video_application/service/api_service.dart';
part 'sounds_service.g.dart';

@Riverpod(keepAlive: true)
class SoundsService extends _$SoundsService {
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
    return getSoundsList();
  }

  Future<List<Datum>> getSoundsList() async {
    var response = await dio.post(SOUNDS_LIST,queryParameters: {'page':arg});
    state = AsyncData(soundsModelFromMap(jsonEncode(response.data)).data!);
    return soundsModelFromMap(jsonEncode(response.data)).data!;
  }
}
