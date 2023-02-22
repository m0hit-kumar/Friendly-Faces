import 'package:flutter/material.dart';
import 'package:friendly_faces/constants/constants.dart';
import 'package:friendly_faces/controller/database_controller.dart';
import 'package:friendly_faces/controller/location_service.dart';
import 'package:friendly_faces/widgets/location_search_widget.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class FindConnection extends StatefulWidget {
  const FindConnection({super.key});

  @override
  State<FindConnection> createState() => _FindConnectionState();
}

class _FindConnectionState extends State<FindConnection> {
  final constants = Get.put(Constants());
  final database = Get.put(DatabaseController());

  final TextEditingController controller = TextEditingController();
  dynamic selectedValue;
  bool isSelected = false;

  String preference = '';
  final location = Get.put(LocationService());
  late LatLng setLocationValue;
  void getlocation() async {
    Position loc = await location.determinePosition();
    print("00000000000000000 $loc");

    setState(() {
      setLocationValue = LatLng(loc.latitude, loc.longitude);
    });
  }

  @override
  initState() {
    super.initState();
    getlocation();
  }

  @override
  Widget build(BuildContext context) {
    print('aaaaaaaaaaaaaaaaaaaaa $selectedValue');
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(10),
          width: Get.width,
          height: Get.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [constants.centerLeftColor, constants.centerRightColor],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.white,
                      size: 18,
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  const Text(
                    "Connections",
                    style: TextStyle(
                        // fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white),
                  ),
                  const Icon(
                    Icons.notifications,
                    color: Colors.white,
                    size: 18,
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(top: 20, left: 18, right: 18),
                height: Get.height / 2,
                child: SingleChildScrollView(
                  child: LocationSearchDialog(
                      controller: controller,
                      onItemSelected: (value) {
                        setState(() {
                          selectedValue = value;
                          controller.text = value["name"];
                          // isSelected = true;
                        });
                      }),
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Container(
                  color: Colors.white,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        preference = 'travel';
                      });
                    },
                    child: const Text("travel"),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        preference = 'room';
                      });
                    },
                    child: const Text("roompartner"),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        preference = 'accomodation';
                      });
                    },
                    child: const Text("accomodation"),
                  ),
                ),
              ]),
              InkWell(
                onTap: () {
                  print("preference----------> $preference");
                  print("Long--------------> $selectedValue");
                  print("getlocation--------------------->$setLocationValue");
                  try {
                    database.setLocationAndPreference(
                        selectedValue["loc"]["lat"],
                        selectedValue["loc"]["long"],
                        preference);
                  } catch (e) {
                    const Text("This is Center Short Toast");
                  }
                  Get.toNamed("connectionPage");
                },
                child: Container(
                  color: Colors.amber,
                  width: Get.width,
                  height: 40,
                  child: const Center(child: Text("Find Connection")),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
