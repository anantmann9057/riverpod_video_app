import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:video_application/modal_classes/user_login_model.dart';
import 'package:video_application/modal_classes/user_model.dart';
import 'package:video_application/service/api_service.dart';
import 'package:get_storage/get_storage.dart';
import 'package:video_application/service/authentication/auth_state.dart';

class AuthenticationService {
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

  Future<String> sendOtp(int phoneNum) async {
    var response =
        await dio.post('send-otp', queryParameters: {'phone': phoneNum});

    return response.data['data']['otp'].toString();
  }

  Future<UserModel> verifyOtp(int phone, int otp, String firebase_token) async {
    var response = await dio.post('verify-otp', queryParameters: {
      'otp': otp,
      'phone': phone,
      'firebase_token': firebase_token
    });

    print(jsonEncode(userModelFromMap(jsonEncode(response.data)).data?.token));

    print(userModelFromMap(jsonEncode(response.data)).data?.user?.name);

    getUserDetails();
    return userModelFromMap(jsonEncode(response.data));
  }

  Future<UserLoginModel> getUserDetails() async {
    var response = await dio.post('user/get-profile',
        queryParameters: {'id': GetStorage().read('userId')});

    Map<String, dynamic> decode_options = jsonDecode(jsonEncode(response.data));

    String user = jsonEncode(UserLoginModel.fromJson(decode_options));

    await GetStorage().write('user', user);

    return userLoginModelFromJson(jsonEncode(response.data));
  }

  signOutUser() async {
    await GetStorage().remove('token');
    await GetStorage().remove('userId');
    await GetStorage().remove('user');
  }
}

final authServiceProvider =
    Provider<AuthenticationService>((ref) => AuthenticationService());
