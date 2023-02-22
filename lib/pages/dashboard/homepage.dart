import 'package:flutter/material.dart';
import 'package:friendly_faces/constants/constants.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final constants = Get.put(Constants());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [constants.centerLeftColor, constants.centerRightColor],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  const Text(
                    "Friendly Faces",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed("/createProfile");
                    },
                    child: const CircleAvatar(
                      radius: 20,
                    ),
                  )
                ],
              ),
            ),
            const Expanded(child: SizedBox()),
            InkWell(
              onTap: () {
                Get.toNamed("/findConnection");
              },
              child: CircleAvatar(
                backgroundColor: const Color(0xFF32726C),
                radius: Get.width / 3,
                backgroundImage: const AssetImage(
                  'assets/images/group.png',
                ),
                child: CircleAvatar(
                    backgroundColor: const Color(0xFF32726C).withOpacity(0.5),
                    radius: Get.width / 3,
                    child: const Center(
                      child: Icon(
                        Icons.add,
                        size: 30,
                        color: Colors.white,
                      ),
                    )),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Friendly Faces",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
            const Text(
              "Friend is just around the corner",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            const Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
