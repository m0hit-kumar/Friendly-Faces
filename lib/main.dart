import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:friendly_faces/pages/auth/auth_page.dart';
import 'package:friendly_faces/pages/auth/create_profile.dart';
import 'package:friendly_faces/pages/dashboard/accommodation_page.dart';
import 'package:friendly_faces/pages/dashboard/connection_page.dart';
import 'package:friendly_faces/pages/dashboard/homepage.dart';
import 'package:friendly_faces/pages/dashboard/find_connection.dart';
import 'package:friendly_faces/pages/dashboard/request_page.dart';
import 'package:friendly_faces/pages/dashboard/trial.dart';
import 'package:friendly_faces/pages/auth/otp_page.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Retrieve the user's authentication state from shared preferences
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isloggedIn = prefs.getBool("isloggedIn") ?? false;

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.android,
  );
  runApp(MyApp(
    isloggedIn: isloggedIn,
  ));
}

class MyApp extends StatelessWidget {
  final bool isloggedIn;
  const MyApp({super.key, required this.isloggedIn});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: isloggedIn ? "/homePage" : "/auth",
      theme: ThemeData(canvasColor: Colors.transparent),
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: '/auth',
          page: () => const AuthPage(),
        ),
        GetPage(
          name: "/otpPage",
          page: () => const AdminOTPScreen(),
        ),
        GetPage(
          name: "/homePage",
          page: () => const HomePage(),
        ),
        GetPage(
          name: "/createProfile",
          page: () => const CreateProfile(),
        ),
        GetPage(
          name: "/findConnection",
          page: () => const FindConnection(),
        ),
        GetPage(
          name: "/trial",
          page: () => const RotatingCircle(),
        ),
        GetPage(
          name: "/connectionPage",
          page: () => const ConnectionPage(),
        ),
        GetPage(
          name: "/requestPage",
          page: () => const RequestPage(),
        ),
        GetPage(
          name: "/accommodationPage",
          page: () => const AccommodationPage(),
        ),
        // GetPage(
        //   name: "/mylocation",
        //   page: () => const MapScreen(),
        // ),
      ],
    );
  }
}
