import 'package:flutter/material.dart';
import 'package:friendly_faces/widgets/location_search_widget.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Autocomplete"),
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        color: Colors.red,
        child: SingleChildScrollView(
          child: LocationSearchDialog(controller: controller),
        ),
      ),
    );
  }
}
