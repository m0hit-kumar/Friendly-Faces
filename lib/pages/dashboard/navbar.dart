import 'package:flutter/material.dart';
import 'package:friendly_faces/constants/decoration.dart';
import 'package:friendly_faces/controller/auth_manager.dart';
import 'package:get/get.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  final _auth = Get.put(AutenticationManager());
  @override
  Widget build(BuildContext context) {
    final DecorationClass decoration = DecorationClass();
    return Container(
      width: Get.width,
      height: Get.height,
      decoration: decoration.background,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Friendly Faces",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Text(
                "Home",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            const Divider(
              color: Colors.white,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Text(
                "Connection ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            const Divider(
              color: Colors.white,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Text(
                "Accommodation",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            const Divider(
              color: Colors.white,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Text(
                "Requests",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            const Divider(
              color: Colors.white,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Text(
                "Settings",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                width: Get.width,
              ),
            ),
            GestureDetector(
              onTap: () {
                print("000000000000000 logged out");
                setState(() {});
                _auth.logout();
              },
              child: Row(
                children: const [
                  Text(
                    "Logout",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  Icon(
                    Icons.logout_outlined,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
