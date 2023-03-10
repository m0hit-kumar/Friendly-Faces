import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:friendly_faces/controller/database_controller.dart';
import 'package:get/get.dart';

class RequestPage extends StatefulWidget {
  const RequestPage({super.key});

  @override
  State<RequestPage> createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  final database = Get.put(DatabaseController());
  final _auth = FirebaseAuth.instance;
  List<String> requests = [];
  late String currentUser;
  void getRequest() async {
    final user = _auth.currentUser?.uid;
    print("000000000000000000000 user");
    var data = await database.getRequests(user!);
    print("00000000000000000000000000000 data $data");

    setState(() {
      requests = data;
      currentUser = user;
    });
  }

  @override
  void initState() {
    super.initState();
    getRequest();
  }

  @override
  Widget build(BuildContext context) {
    final Mylist = [
      {"avatar": "one", "user": "Tony Stark", "msg": "hi", "time": "3:30pm"},
      {
        "avatar": "two",
        "user": "Sakshi",
        "msg": "how are you?",
        "time": "3:15pm"
      },
      {"avatar": "three", "user": "Nirajan", "msg": "hi", "time": "3:10pm"}
    ];
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF32726C),
        body: Column(
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
                    "Requests",
                    style: TextStyle(
                        // fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed("homePage");
                    },
                    child: const Icon(
                      Icons.home,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              height: 10,
              color: Colors.white,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: requests.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
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
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage(
                                    "assets/images/${Mylist[index]["avatar"]}.jpg"),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "${Mylist[index]["user"]}",
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 80),
                                child: InkWell(
                                  onTap: () async {
                                    await database.updateChattingWith(
                                        currentUser, requests[index]);
                                    Get.toNamed("homePage");
                                  },
                                  child: const Icon(
                                    Icons.done_rounded,
                                    color: Color(0xFF32726C),
                                    size: 27,
                                  ),
                                ),
                              ),
                              const VerticalDivider(
                                thickness: 2,
                                //indent: 20,
                                //endIndent: 0,
                                color: Color.fromARGB(255, 7, 45, 76),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.toNamed("chatPage");
                                },
                                child: const Icon(
                                  Icons.close,
                                  color: Colors.red,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );

                    ;
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
