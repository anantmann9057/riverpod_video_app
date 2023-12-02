import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/utils.dart';
import 'package:get_storage/get_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:video_application/modal_classes/user_login_model.dart';
import 'package:video_application/service/authentication/auth_state.dart';
import 'package:video_application/service/authentication/authentication.dart';
import 'package:video_application/service/authentication/authentication_service.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final Authentication _authenticationService;

  AuthNotifier(this._authenticationService) : super(AuthState.PROCESSING) {
    isUserLoggedIn();
  }

  var dio = Dio(BaseOptions(
      baseUrl: 'https://thrill.fun/api/',
      headers: {
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYzc2MGQxZjdhNDcyMTM0NmViMTZjYmM3NDc4OWYzODgxOTFjZDIyNzEwNTkwMjE5M2FlNWNiMzk0ZGQxMTg4YWRlNjcwZmI1NTA4OWI1MGEiLCJpYXQiOjE2OTAzNTI2NDkuNDM3NDQzMDE3OTU5NTk0NzI2NTYyNSwibmJmIjoxNjkwMzUyNjQ5LjQzNzQ0Mzk3MTYzMzkxMTEzMjgxMjUsImV4cCI6MTcyMTk3NTA0OS40MzQ2ODY4OTkxODUxODA2NjQwNjI1LCJzdWIiOiI2MCIsInNjb3BlcyI6W119.IL7t1NNVuDE7eanE7hLZfpxp7cqLK-ORAHIKZgK0BswrovGExsBFE_9tJFEyJR4WvbsaakRY0BZTIbA9t1xPEfVhDJZsvvZ-UnP49bcTXAY75edktvIIilRhR-J4QtYfhAUtHF673kznsjvPKNnlJX1MJsyyJRAgDtOulvJEMQG-3ziKumqSaxAQUvLUg5Qjm-YShTPzrzGQ9miAD53GrbndwWwgT8X9jp5j3DyvQKFfdrVXtXutKeDkJA_SgiEuqyFgO38lXGGYaSPNsLZyVs871GdoML66u2-fq7yNBT45cu0Eq0bB50ddwIzNsqzAs9OVUq1Pa_b46caE1N3mRYihr6roIM535kriJCK-e5ov8Ucj7ym32dYaIDdP6U9uNMFieYSZW6mZqbKudZRpN6QwDU4E7t2TbNpPLmPqfnvmhavhjnMBP_MQybvJti7UmyS6iHIMCssZtq_c6MNtRgy_jFYaHUiSzVcpojoI-3M8gnw5fQVrvnbP6rYBUuKrkHmdCBju2L4twyahYrRbbXuHA07pm-ecJ1Pb8AIieYj2j-E5OSwSP2gVx8It8tCyMIZWqm--p3p3v9OzUHV0zK5wrLdRGQvsv-iDBeOiJzdMynRR3FLFi6Zic_WPfs72LRszhVWDgrdqQ4zjX8cbtpgb2KqwbLl5Nio5M2WGZ3w,"Accept":"application/json"'
      },
      followRedirects: false,
      validateStatus: (status) {
        return status! < 500;
      }));

  isUserLoggedIn() async {
    if (GetStorage().read('token') != null ||
        state == AuthState.Authenticated) {
      state = AuthState.Authenticated;
      print('log in');
    } else {
      state = AuthState.Unauthenticated;
    }
    print(state);
  }

  Future<void> signOutUser() async {
    await _authenticationService.signOut();
    state = AuthState.Unauthenticated;
  }

  loginUser(
      {required BuildContext context}) async {
    await _authenticationService
        .signInWithGoogle(
           context)
        .then((value) async {
      state = AuthState.Authenticated;
    });
  }
}

final authNotiferProvider = StateNotifierProvider<AuthNotifier, AuthState>(
    (ref) => AuthNotifier(ref.watch(authenticationProvider)));
