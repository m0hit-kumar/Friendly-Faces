import 'package:flutter/material.dart';

class RequestPage extends StatefulWidget {
  const RequestPage({super.key});

  @override
  State<RequestPage> createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color(0xFF32726C),
          body: SingleChildScrollView(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: const [
                    Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 80),
                      child: Center(
                        child: Text(
                          " RequestPage",
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
              SizedBox(
                height: 640,
                child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      //color: Colors.white,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(12),
                        ),
                        border: Border.all(
                          width: 3,
                          color: Colors.white,
                          style: BorderStyle.solid,
                        ),
                      ),
                      height: 61,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Icon(
                              Icons.account_circle_rounded,
                              color: Colors.grey,
                              size: 38,
                            ),

                            Row(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Container(
                                  child: Text(
                                    "User " "$index",
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            //ignore: prefer_const_constructors

                            const Padding(
                              padding: EdgeInsets.only(left: 80),
                              child: Icon(
                                Icons.done_rounded,
                                color: Color(0xFF32726C),
                                size: 27,
                              ),
                            ),

                            const VerticalDivider(
                              thickness: 2,
                              //indent: 20,
                              //endIndent: 0,
                              color: Color.fromARGB(255, 7, 45, 76),
                            ),

                            const Icon(
                              Icons.close,
                              color: Colors.red,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ))),
    );
  }
}
