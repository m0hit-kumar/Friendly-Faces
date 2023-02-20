import 'package:flutter/material.dart';
import 'package:friendly_faces/controller/location_service.dart';
import 'package:get/get.dart';

class LocationSearchDialog extends StatefulWidget {
  final TextEditingController controller;
  const LocationSearchDialog({super.key, required this.controller});

  @override
  State<LocationSearchDialog> createState() => _LocationSearchDialogState();
}

class _LocationSearchDialogState extends State<LocationSearchDialog> {
  final location = Get.put(LocationService());

  List<dynamic> _placeList = [];
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      onChnage();
    });
  }

  Future<void> onChnage() async {
    print("....................... ${widget.controller.text}");
    final List<dynamic> newList =
        await location.getSuggestion(widget.controller.text);
    setState(() {
      _placeList = [];
      _placeList = newList;
    });
    print("0000000000000000000000000 $_placeList");
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height / 2,
      // color: Colors.yellow,
      child: Column(
        children: [
          TextFormField(
            controller: widget.controller,
            decoration: const InputDecoration(hintText: "Search"),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _placeList.length,
              itemBuilder: (context, index) {
                final e = _placeList[index];

                final placeName = e["name"];
                print("-------------- $e----------- ${placeName.runtimeType}");

                return Container(
                  color: Colors.white,
                  child: ListTile(
                    title: Text("$placeName"),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
