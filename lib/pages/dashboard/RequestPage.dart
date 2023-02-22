import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class Requests extends StatelessWidget {
  const Requests({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xFF32726C),
          body: Container(
            child: SingleChildScrollView(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Colors.white,
                      ),
                      // ignore: prefer_const_constructors
                      Padding(
                        padding: const EdgeInsets.only(left: 80),
                        child: const Center(
                          child: Text(
                            "Requests",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  height: 10,
                  color: Colors.white,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        // ignore: prefer_const_constructors
                        Icon(
                          Icons.account_circle_rounded,
                          color: Colors.grey,
                          size: 30,
                        ),
                        Text("User 1"),
                        // ignore: prefer_const_constructors
                        Icon(
                          Icons.done_rounded,
                          color: Color.fromARGB(255, 36, 156, 98),
                          size: 20,
                        ),
                        const VerticalDivider(
                          width: 20,
                          thickness: 2,
                          //indent: 20,
                          //endIndent: 0,
                          color: Colors.black,
                        ),
                        // ignore: prefer_const_constructors
                        Icon(
                          Icons.done_rounded,
                          color: Color.fromARGB(255, 36, 156, 98),
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )),
          )),
    );
  }
}
