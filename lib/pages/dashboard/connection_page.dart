import 'package:flutter/material.dart';
import 'package:friendly_faces/controller/database_controller.dart';
import 'package:get/get.dart';

class ConnectionPage extends StatefulWidget {
  const ConnectionPage({super.key});

  @override
  State<ConnectionPage> createState() => _ConnectionPageState();
}

class _ConnectionPageState extends State<ConnectionPage> {
  final database = Get.put(DatabaseController());
  late Map<String, dynamic> userProfile;
  List<String> connections = ["k", "j"];

  void findConnection() async {
    var data = await database.findConnections();

    print("00000000000000000000000000000 data $data");

    setState(() {
      connections = data;
    });
  }

  void getuser() async {
    var userData = await database.getUser();
    setState(() {
      userProfile = userData;
    });
    print("000000000000000)))) $userProfile");
  }

  @override
  void initState() {
    super.initState();
    getuser();
    findConnection();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
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
              ),
              const Divider(
                height: 10,
                color: Colors.white,
              ),
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: Expanded(
                    child: SizedBox(
                      // color: Colors.yellow,
                      height: 602,
                      child: GridView.count(
                          crossAxisCount: 2,
                          children: List.generate(
                              connections.length,
                              (index) => Padding(
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
                                            onPressed: () {
                                              database.sendRequest(
                                                  connections[index]);
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  const Color(0xFF32726C),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: const [
                                                Text(
                                                  'Connect',
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ))),
                    ),
                  ))
            ],
          ),
        ),
        backgroundColor: const Color(0xFF32726C),
        // body:
      ),
    );
  }
}
