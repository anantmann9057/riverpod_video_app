import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_application/firebase_options.dart';
import 'package:video_application/service/authentication/auth_notifier.dart';
import 'package:video_application/service/authentication/auth_state.dart';
import 'package:video_application/service/authentication/authentication.dart';
import 'package:video_application/service/authentication/authentication_service.dart';
import 'package:video_application/service/push_notification_service.dart';
import 'package:video_application/ui/discover_screen.dart';
import 'package:video_application/ui/home_screen.dart';
import 'package:video_application/ui/profile_screen.dart';
import 'package:video_application/ui/sounds_screen.dart';

void main() async {
  await GetStorage.init();

  WidgetsFlutterBinding.ensureInitialized();
  await Permission.notification.isDenied.then((value) {
    if (value) {
      Permission.notification.request();
    }
  });

  runApp(ProviderScope(child: MyApp()));
}

final firebaseinitializerProvider = FutureProvider<FirebaseApp>((ref) async {
  return await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform);
});

class MyApp extends ConsumerWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initialize = ref.watch(firebaseinitializerProvider);
    final notif = ref.watch(notifProvider);
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      home: initialize.when(
          data: (value) {
            notif
                .resolvePlatformSpecificImplementation<
                    AndroidFlutterLocalNotificationsPlugin>()
                ?.createNotificationChannel(ref.read(notifChannel));

            FirebaseMessaging.onMessage.listen((message) {
              RemoteNotification notification = message.notification!;
              AndroidNotification android = message!.notification!.android!;

              // If `onMessage` is triggered with a notification, construct our own
              // local notification to show to users using the created channel.
              if (notification != null && android != null) {
                notif.show(
                    notification.hashCode,
                    notification.title,
                    notification.body,
                    NotificationDetails(
                      android: AndroidNotificationDetails(
                        ref.read(notifChannel).id,
                        ref.read(notifChannel).name,
                        channelDescription: ref.read(notifChannel).description,
                        icon: android?.smallIcon,
                        // other properties...
                      ),
                    ));
              }
            });
            return const Home();
          },
          error: (error, trace) {
            print(error.toString() + trace.toString());
            return Scaffold(
              body: Align(
                alignment: Alignment.center,
                child: Text(error.toString() + trace.toString()),
              ),
            );
          },
          loading: () => const Align(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              )),
    );
  }
}

var selectedScreen = StateProvider((ref) => 0);

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var screens = [
      const HomeScreen(),
      DiscoverScreen(),
      SoundsScreen(),
      ProfileScreen()
    ];
    ref.watch(selectedScreen);
    ref.watch(authNotiferProvider);
    var _auth = ref.watch(authenticationProvider);
    var _user = ref.watch(authStateProvider);
    var serviceProvider = ref.watch(authServiceProvider);
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.3))]
        ),
        child: BottomNavigationBar(
          elevation: 0,
          selectedLabelStyle: TextStyle(color: Colors.red),
          unselectedLabelStyle: TextStyle(color: Colors.black),
          currentIndex: ref.watch(selectedBottomIndex.notifier).state,
          onTap: (index) async {
            if (index == 3) {
              if (ref.watch(authStateProvider).value == null) {
                await _auth.signInWithGoogle(context).then((value) {
                  ref.watch(selectedBottomIndex.notifier).state = index;
                  ref.watch(selectedScreen.notifier).state = index;
                });
              } else {
                await serviceProvider.getUserDetails();
                // await _auth.signOut();
                ref.watch(selectedBottomIndex.notifier).state = index;
                ref.watch(selectedScreen.notifier).state = index;
              }
              // if (ref.watch(authNotiferProvider) == AuthState.Authenticated) {
              //   ref.read(selectedBottomIndex.notifier).state = index;
              //   ref.read(selectedScreen.notifier).state = index;
              // } else {
              //   ref.watch(authNotiferProvider.notifier).loginUser();
              // }
            } else {
              ref.watch(selectedBottomIndex.notifier).state = index;
              ref.watch(selectedScreen.notifier).state = index;
            }
          },
          items: [
            BottomNavigationBarItem(
                backgroundColor: Colors.transparent.withOpacity(0.0),
                icon: Icon(
                  Icons.home,
                  color: Colors.red,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                backgroundColor: Colors.transparent.withOpacity(0.0),
                icon: Icon(Icons.dashboard, color: Colors.red),
                label: 'Discover'),
            BottomNavigationBarItem(
                backgroundColor: Colors.transparent.withOpacity(0.0),
                icon: Icon(Icons.music_note, color: Colors.red),
                label: 'Wallet'),
            BottomNavigationBarItem(
                backgroundColor: Colors.transparent.withOpacity(0.0),
                icon: _user.when(
                    data: (user) => user != null
                        ? ClipOval(
                      child: CachedNetworkImage(
                          height: 25,
                          width: 25,
                          fit: BoxFit.cover,
                          imageUrl: user?.photoURL ?? ''),
                    )
                        : ref.read(authNotiferProvider) ==
                        AuthState.Authenticated
                        ? CircularProgressIndicator()
                        : Icon(
                      Icons.person,
                      color: Colors.red,
                    ),
                    error: (error, trace) => Icon(Icons.person),
                    loading: () => CircularProgressIndicator()),
                label: 'Profile')
          ]),),
      body: screens[ref.read(selectedScreen)],
    );
  }
}
