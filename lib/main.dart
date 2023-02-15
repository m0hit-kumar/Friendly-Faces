import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:friendly_faces/pages/auth/auth_page.dart';
import 'package:friendly_faces/pages/dashboard/Signup.dart';
import 'package:friendly_faces/pages/dashboard/home.dart';
import 'package:friendly_faces/pages/dashboard/homepage.dart';
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
    return GetMaterialApp(
      initialRoute: "/home1",
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/home', page: () => const AuthPage()),
        GetPage(name: '/done', page: () => const Done()),
        GetPage(name: '/practice', page: () => const Practice()),
        GetPage(name: '/home1', page: () => const Home())
      ],
    );
  }
}
