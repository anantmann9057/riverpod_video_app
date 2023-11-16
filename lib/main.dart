import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import 'package:video_application/modal_classes/user_login_model.dart';
import 'package:video_application/modal_classes/user_model.dart';
import 'package:video_application/service/authentication/auth_notifier.dart';
import 'package:video_application/service/authentication/auth_state.dart';
import 'package:video_application/service/authentication/authentication_service.dart';
import 'package:video_application/ui/discover_screen.dart';
import 'package:video_application/ui/hashtag_details_screen.dart';
import 'package:video_application/ui/home_screen.dart';
import 'package:video_application/ui/profile_screen.dart';
import 'package:video_application/ui/sounds_screen.dart';

void main() async {
  await GetStorage.init();

  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

final firebaseinitializerProvider = FutureProvider<FirebaseApp>((ref) async {
  return await Firebase.initializeApp();
});

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

var selectedScreen = StateProvider((ref) => 0);

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var screens = [
      HomeScreen(),
      DiscoverScreen(),
      SoundsScreen(),
      ProfileScreen()
    ];
    ref.watch(selectedScreen);
    ref.watch(authNotiferProvider);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          selectedLabelStyle: TextStyle(color: Colors.red),
          unselectedLabelStyle: TextStyle(color: Colors.black),
          currentIndex: ref.read(selectedBottomIndex.notifier).state,
          onTap: (index) async {
            if (index == 3) {
              if (ref.watch(authNotiferProvider) == AuthState.Authenticated) {
                ref.read(selectedBottomIndex.notifier).state = index;
                ref.read(selectedScreen.notifier).state = index;
              } else {
                ref.watch(authNotiferProvider.notifier).loginUser();
              }
            } else {
              ref.read(selectedBottomIndex.notifier).state = index;
              ref.read(selectedScreen.notifier).state = index;
            }
          },
          items: [
            const BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.red,
                ),
                label: 'Home'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.dashboard, color: Colors.red),
                label: 'Discover'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.music_note, color: Colors.red),
                label: 'Wallet'),
            BottomNavigationBarItem(
                icon: ref.read(authNotiferProvider) ==
                            AuthState.Authenticated &&
                        GetStorage().read('token') != null
                    ? ClipOval(
                        child: CachedNetworkImage(
                            height: 25,
                            width: 25,
                            fit: BoxFit.cover,
                            imageUrl:
                                "https://thrill.fun/public/uploads/profile_images/${UserLoginModel.fromJson(jsonDecode(GetStorage().read('user'))).data?.user?.avatar}"),
                      )
                    : ref.read(authNotiferProvider) == AuthState.Authenticated
                        ? CircularProgressIndicator()
                        : Icon(
                            Icons.person,
                            color: Colors.red,
                          ),
                label: 'Profile')
          ]),
      body: screens[ref.read(selectedScreen)],
    );
  }
}
