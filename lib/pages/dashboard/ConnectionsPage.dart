import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      // ignore: prefer_const_constructors
                      Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Colors.white,
                      ),
                      const Text(
                        "Connections",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.white),
                      ),
                      // ignore: prefer_const_constructors
                      Icon(
                        Icons.notifications,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 10,
                  color: Colors.white,
                ),
                Padding(
                    padding: const EdgeInsets.all(10),
                    child: Expanded(
                      child: Container(
                        // color: Colors.yellow,
                        height: 602,
                        child: GridView.count(
                            crossAxisCount: 2,
                            children: List.generate(
                                8,
                                (Index) => Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Container(
                                        //color: Colors.white,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                          border: Border.all(
                                            width: 3,
                                            color: Colors.white,
                                            style: BorderStyle.solid,
                                          ),
                                        ),
                                        child: Column(
                                          // ignore: prefer_const_literals_to_create_immutables
                                          children: [
                                            const Padding(
                                              padding: EdgeInsets.all(20),
                                              child: Icon(
                                                Icons.account_circle_rounded,
                                                color: Colors.grey,
                                                size: 50,
                                              ),
                                            ),
                                            ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                primary:
                                                    const Color(0xFF32726C),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                // ignore: prefer_const_literals_to_create_immutables
                                                children: [
                                                  const Text(
                                                    'Connect',
                                                  ), // <-- Text
                                                  // const SizedBox(
                                                  //   width: 1,
                                                  // ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ))

                            //     //
                            //     // Padding(

                            //     //   padding: const EdgeInsets.all(10),
                            //     //   child: Container(
                            //     //     color: Colors.white,

                            //     //   ),

                            //     // ),
                            //     // Padding(
                            //     //   padding: const EdgeInsets.all(10),
                            //     //   child: Container(
                            //     //     color: Colors.red,
                            //     //   ),
                            //     // ),
                            //     // Padding(
                            //     //   padding: const EdgeInsets.all(10),
                            //     //   child: Container(
                            //     //     color: Colors.blue,
                            //     //   ),
                            //     // ),
                            //     // Padding(
                            //     //   padding: const EdgeInsets.all(10),
                            //     //   child: Container(
                            //     //     color: Colors.pink,
                            //     //   ),
                            //     // ),

                            ),
                      ),
                    ))
              ],
            ),
          ),
        ),
        backgroundColor: const Color(0xFF32726C),
        // body:
      ),
    );
  }
}
