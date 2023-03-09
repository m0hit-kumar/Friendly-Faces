import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:friendly_faces/constants/decoration.dart';
import 'package:friendly_faces/controller/accomodation_controller.dart';
import 'package:get/get.dart';

import 'package:geoflutterfire2/geoflutterfire2.dart';

class AccommodationPage extends StatefulWidget {
  const AccommodationPage({super.key});

  @override
  State<AccommodationPage> createState() => _AccommodationPageState();
}

class _AccommodationPageState extends State<AccommodationPage> {
  final geo = GeoFlutterFire();
  final decoration = DecorationClass();
  final accommodation = Get.put(AccomodationController());
  final _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    GeoFirePoint center =
        geo.point(latitude: 30.357084347294474, longitude: 76.75669827448608);
    var collectionReference = _firestore.collection('accommodation');

    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 50, 114, 108),
          onPressed: () {
            Get.toNamed("createAccommodationPage");
          },
          tooltip: 'Create Accommodation',
          child: const Icon(
            Icons.create,
            color: Colors.white,
          ),
        ),
        body: Container(
          height: Get.height,
          width: Get.width,
          decoration: decoration.background,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                      onPressed: () {
                        Get.back(canPop: true);
                      },
                    ),
                    // ignore: prefer_const_constructors
                    Center(
                      child: InkWell(
                        onTap: () {
                          accommodation.findAccommodation();
                        },
                        child: const Text(
                          "Accomodation",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),

                    const CircleAvatar(
                      backgroundColor: Colors.red,
                      backgroundImage: AssetImage("assets/images/one.jpg"),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, left: 10, right: 10),
                child: TextField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    fillColor: const Color.fromARGB(255, 231, 241, 239),
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none),
                    hintText: 'Search',
                    hintStyle:
                        const TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    color: Colors.white,
                  ),
                  width: Get.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Accommodation Near You",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: StreamBuilder(
                          stream: geo
                              .collection(collectionRef: collectionReference)
                              .within(
                                  center: center, radius: 50.0, field: "loc"),
                          builder: (BuildContext context,
                              AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
                            if (!snapshot.hasData) {
                              return const CircularProgressIndicator();
                            }
                            final List<DocumentSnapshot> documents =
                                snapshot.data!;
                            print("0000000000000000000000001 $documents");

                            return GridView.count(
                              padding: const EdgeInsets.all(8.0),
                              crossAxisCount: 2,
                              children: documents.map(
                                (document) {
                                  Map<String, dynamic> data =
                                      document.data() as Map<String, dynamic>;

                                  final GeoPoint location =
                                      data["loc"]["geopoint"];
                                  final String imgUrl = data["image"];
                                  final String about = data["about"];
                                  final latitude = location.latitude
                                      .toString()
                                      .substring(0, 4);
                                  final longitude = location.longitude
                                      .toString()
                                      .substring(0, 4);

                                  print(
                                      "00000000000000000 ${location.latitude}");
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: Image.network(
                                            imgUrl,
                                          ),
                                        ),
                                        Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(about)),
                                        Align(
                                            alignment: Alignment.centerLeft,
                                            child: Row(
                                              children: [
                                                const Icon(Icons.location_city),
                                                Text("$latitude ,$longitude"),
                                              ],
                                            )),
                                      ],
                                    ),
                                  );
                                },
                              ).toList(),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
