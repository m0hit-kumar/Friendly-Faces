import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:friendly_faces/pages/auth/auth_page.dart';
import 'package:friendly_faces/pages/auth/create_profile.dart';
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
    return GetMaterialApp(
      initialRoute: "/auth",
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
          name: "/createProfile",
          page: () => const CreateProfile(),
        ),
      ],
    );
  }
}
