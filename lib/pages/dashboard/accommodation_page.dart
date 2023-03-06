import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccommodationPage extends StatefulWidget {
  const AccommodationPage({super.key});

  @override
  State<AccommodationPage> createState() => _AccommodationPageState();
}

class _AccommodationPageState extends State<AccommodationPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed("createAccommodationPage");
        },
        tooltip: 'Increment',
        child: const Icon(
          Icons.create,
          color: Colors.white,
        ),
      ),
      backgroundColor: const Color(0xFF32726C),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            children: const [
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              // ignore: prefer_const_constructors
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Center(
                  child: Text(
                    "Accomodation",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: 60),
                child: Icon(
                  Icons.account_circle_rounded,
                  color: Colors.white,
                  size: 38,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30, right: 20, left: 20),
          child: TextField(
            cursorColor: Colors.black,
            decoration: InputDecoration(
              fillColor: const Color.fromARGB(255, 231, 241, 239),
              filled: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none),
              hintText: 'Search',
              hintStyle: const TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 231, 241, 239),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30, left: 1, right: 1),
                  child: SizedBox(
                    height: 525,
                    child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      itemCount: 4,
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 20, height: 5),
                      itemBuilder: (context, index) => Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: SizedBox(
                          height: 200,
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Container(
                                    width: 200,
                                    color: Colors.grey,
                                    child: Text("$index"));
                              },
                              separatorBuilder: (context, index) {
                                return const SizedBox(
                                  width: 20,
                                );
                              },
                              itemCount: 4),
                        ),
                      ),
                    ),
                  ),
                ),
              )),
        ),
      ]),
    ));
  }
}
