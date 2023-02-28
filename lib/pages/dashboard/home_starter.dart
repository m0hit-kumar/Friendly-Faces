import 'package:flutter/material.dart';
import 'package:friendly_faces/constants/constants.dart';
import 'package:get/get.dart';

class HomePageStarter extends StatefulWidget {
  const HomePageStarter({super.key});

  @override
  State<HomePageStarter> createState() => _HomePageStarterState();
}

class _HomePageStarterState extends State<HomePageStarter> {
  final constants = Get.put(Constants());
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
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
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
        ),
        const Text(
          "Friend is just around the corner",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        const Expanded(child: SizedBox()),
      ],
    );
    ;
  }
}
