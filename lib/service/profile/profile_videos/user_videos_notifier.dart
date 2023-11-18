import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';
import 'package:video_application/modal_classes/user_videos_model.dart';
import 'package:video_application/service/profile/profile_videos/user_videos_state.dart';

import '../../api_service.dart';

class UserVideosNotifer extends StateNotifier<UserVideosState> with PagedNotifierMixin<int, Datum, UserVideosState>{
  UserVideosNotifer():super(UserVideosState());
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
  Future<List<Datum>?> load(int page, int limit)async  {
    try {
      //as build can be called many times, ensure
      //we only hit our page API once per page
      if (state.previousPageKeys.contains(page)) {
        await Future.delayed(const Duration(seconds: 0), () {
          state = state.copyWith();
        });
        return state.records;
      }
      var response = await dio.post(USER_VIDEOS);

      var users = userVideosModelFromMap(jsonEncode(response.data));

      // we then update state accordingly
      state = state.copyWith(records: [
        ...(state.records ?? []),
        ...?users.data
      ], nextPageKey: (users.pagination!.currentPage??0)+1,
          previousPageKeys: {...state.previousPageKeys, page}.toList());
    } catch (e) {
      // in case of error we should notifiy the listeners
      state = state.copyWith(error: e.toString());
    }  }

}

final userVideoProvider =
StateNotifierProvider<UserVideosNotifer, UserVideosState>(
        (_) => UserVideosNotifer());