import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Chat1 extends StatelessWidget {
  const Chat1({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();

    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xFF32726C),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            // ignore: prefer_const_literals_to_create_immutables
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              // ignore: prefer_const_constructors
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: const Center(
                  child: Text(
                    "Accomodation",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white),
                  ),
                ),
              ),

              // ignore: prefer_const_constructors
              Padding(
                padding: const EdgeInsets.only(left: 60),
                child: const Icon(
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
              fillColor: Color.fromARGB(255, 231, 241, 239),
              filled: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none),
              hintText: 'Search',
              hintStyle: const TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 231, 241, 239),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 30, left: 1, right: 1),
                      child: SizedBox(
                        height: 600,
                        child: ListView.separated(
                          scrollDirection: Axis.vertical,
                          itemCount: 4,
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 20, height: 5),
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.only(
                                top: 20, left: 20, right: 20),
                            child: SizedBox(
                              height: 200,
                              child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Expanded(
                                      child: Container(
                                          width: 200,
                                          color: Colors.grey,
                                          child: Text("$index")),
                                    );
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
                  ],
                ),
              )),
        )),
      ]),
    ));
  }
}
