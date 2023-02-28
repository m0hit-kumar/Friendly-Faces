import 'package:flutter/material.dart';
import 'package:friendly_faces/controller/location_service.dart';
import 'package:get/get.dart';

class LocationSearchDialog extends StatefulWidget {
  final TextEditingController controller;
  final Function(dynamic) onItemSelected;
  const LocationSearchDialog(
      {super.key, required this.controller, required this.onItemSelected});

  @override
  State<LocationSearchDialog> createState() => _LocationSearchDialogState();
}

class _LocationSearchDialogState extends State<LocationSearchDialog> {
  final location = Get.put(LocationService());

  List<dynamic> _placeList = [];
  String hintText = "Search Location";

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
      child: Column(
        children: [
          Container(
            // width: Get.width,
            padding: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextFormField(
              controller: widget.controller,
              decoration: InputDecoration(
                suffixIcon: const Icon(Icons.search),
                hintText: hintText,
              ),
            ),
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
                    onTap: () {
                      print("eeeeeeeeeeeeeeeee ${e.runtimeType}");
                      widget.onItemSelected(e); //
                    },
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
