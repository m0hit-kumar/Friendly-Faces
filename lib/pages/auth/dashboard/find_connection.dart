import 'package:flutter/material.dart';
import 'package:friendly_faces/widgets/location_search_widget.dart';
import 'package:get/get.dart';

class FindConnection extends StatefulWidget {
  const FindConnection({super.key});

  @override
  State<FindConnection> createState() => _FindConnectionState();
}

class _FindConnectionState extends State<FindConnection> {
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
