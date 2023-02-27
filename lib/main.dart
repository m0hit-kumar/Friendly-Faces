import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:friendly_faces/controller/loctemp.dart';
import 'package:friendly_faces/pages/auth/auth_page.dart';
import 'package:friendly_faces/pages/auth/create_profile.dart';
import 'package:friendly_faces/pages/dashboard/chatpage.dart';
import 'package:friendly_faces/pages/dashboard/connection_page.dart';
import 'package:friendly_faces/pages/dashboard/homepage.dart';
import 'package:friendly_faces/pages/dashboard/find_connection.dart';
import 'package:friendly_faces/pages/dashboard/mylocpage.dart';
import 'package:friendly_faces/pages/dashboard/request_page.dart';
import 'package:friendly_faces/pages/dashboard/trial.dart';
import 'package:friendly_faces/pages/auth/otp_page.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.android,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LocationController());

    return GetMaterialApp(
      initialRoute: "/auth",
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
          page: () => const CircleWidget(),
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
          name: "/mylocation",
          page: () => const MapScreen(),
        ),
        GetPage(
          name: "/chatPage",
          page: () => const ChatPage(),
        ),
      ],
    );
  }
}
