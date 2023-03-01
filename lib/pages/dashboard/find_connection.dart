import 'package:flutter/material.dart';
import 'package:friendly_faces/constants/constants.dart';
import 'package:friendly_faces/constants/decoration.dart';
import 'package:friendly_faces/controller/database_controller.dart';
import 'package:friendly_faces/controller/location_service.dart';
import 'package:friendly_faces/widgets/dialer.dart';
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

  final DecorationClass decoration = DecorationClass();
  Map<String, Icon> optionList = {
    "room": const Icon(
      Icons.bed,
      color: Colors.white,
    ),
    "travel": const Icon(
      Icons.commute_sharp,
      color: Colors.white,
    ),
    "accomodation": const Icon(
      Icons.add_home_work,
      color: Colors.white,
    ),
    "friend": const Icon(
      Icons.group_add,
      color: Colors.white,
    )
  };
  @override
  Widget build(BuildContext context) {
    String inputText = 'Search location....';

    print('aaaaaaaaaaaaaaaaaaaaa $selectedValue');
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(10),
          width: Get.width,
          height: Get.height,
          decoration: decoration.background,
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
                  IconButton(
                      onPressed: () {
                        Get.toNamed("requestPage");
                      },
                      icon: const Icon(
                        Icons.notifications,
                        color: Colors.white,
                        size: 18,
                      )),
                ],
              ),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    isScrollControlled: false,
                    context: context,
                    builder: (BuildContext context) {
                      return SingleChildScrollView(
                        child: LocationSearchDialog(
                            controller: controller,
                            onItemSelected: (value) {
                              setState(() {
                                selectedValue = value;
                                controller.text = value["name"];
                                inputText = value['name'];
                                Navigator.pop(context);
                                // isSelected = true;
                              });
                            }),
                      );
                    },
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(23),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            inputText,
                          ),
                        ),
                        const Icon(Icons.search),
                      ],
                    ),
                  ),
                ),
              ),
              const Expanded(child: SizedBox()),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    preference.toUpperCase(),
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              Center(
                  child: Dialer(
                options: optionList,
                onItemSelected: (value) {
                  print('cccccccc');
                  print("00000000000000000 value $value");
                  setState(() {
                    preference = value;
                  });
                },
              )),
              const Expanded(child: SizedBox()),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(width: 2.0, color: Colors.white),
                ),
                onPressed: () async {
                  print("preference----------> $preference");
                  print("Long--------------> $selectedValue");
                  print("getlocation--------------------->$setLocationValue");
                  // print("000000000000000000 ${selectedValue["loc"]["lat"]}");
                  // try {

                  await database.setLocationAndPreference(
                      selectedValue != null
                          ? selectedValue["loc"]["lat"]
                          : setLocationValue.latitude,
                      selectedValue != null
                          ? selectedValue["loc"]["long"]
                          : setLocationValue.longitude,
                      preference);

                  Get.toNamed("connectionPage");
                  // } catch (e) {
                  //   const Text("This is Center Short Toast");
                  // }
                },
                child: const Center(
                    child: Text(
                  "Find Connection",
                  style: TextStyle(color: Colors.white),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  bool _showOptions = false;
  String _searchText = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(23),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onChanged: (value) {
                setState(() {
                  _searchText = value;
                  _showOptions = true;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search...',
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              setState(() {
                _showOptions = true;
              });
            },
          ),
          if (_showOptions) // This will only show if _showOptions is true
            Expanded(
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(23),
                  color: Colors.white,
                ),
                child: Center(
                  child: Text('Options'),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
