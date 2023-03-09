import 'dart:io';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:friendly_faces/constants/constants.dart';
import 'package:friendly_faces/constants/decoration.dart';
import 'package:friendly_faces/controller/accomodation_controller.dart';
import 'package:friendly_faces/widgets/image_picker_dialog.dart';
import 'package:get/get.dart';

class CreateAccomodation extends StatefulWidget {
  const CreateAccomodation({super.key});

  @override
  State<CreateAccomodation> createState() => _CreateAccomodationState();
}

class _CreateAccomodationState extends State<CreateAccomodation> {
  final DecorationClass decoration = DecorationClass();
  final accomodation = Get.put(AccomodationController());
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();

  File? _imageFile;
  Future<void> _showImagePicker() async {
    await showDialog(
      context: context,
      builder: (context) {
        return ImagePickerDialog(
          imageFile: _imageFile,
          onImageSelected: (File? imageFile) {
            setState(() {
              _imageFile = imageFile;
            });
          },
        );
      },
    );
  }

  final constants = Get.put(Constants());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            decoration: decoration.background,
            width: Get.width,
            height: Get.height,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 20,
                            )),
                        Text(
                          "Create Profile",
                          style: TextStyle(
                            fontSize: 20,
                            color: constants.whiteBackground,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        "Name",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xffa3b1c6), // darker color
                          ),
                          BoxShadow(
                            color: Color(0xffe0e5ec), // background color
                            spreadRadius: -12.0,
                            blurRadius: 12.0,
                          ),
                        ],
                        color: constants.inputBackgroundColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: constants.whiteBackground),
                      ),
                      // width: 60,
                      height: 50,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: TextFormField(
                          controller: name,
                          decoration: const InputDecoration(
                            hintText: "Tony Stark",
                            border: InputBorder.none,
                          ),
                          autofocus: false,
                          style: const TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 19, 19, 19)),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        "Description",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xffa3b1c6), // darker color
                          ),
                          BoxShadow(
                            color: Color(0xffe0e5ec), // background color
                            spreadRadius: -12.0,
                            blurRadius: 12.0,
                          ),
                        ],
                        color: constants.inputBackgroundColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: constants.whiteBackground),
                      ),
                      // width: 60,
                      // height: ,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: TextFormField(
                          maxLines: 4,
                          controller: description,
                          decoration: const InputDecoration(
                            hintText: "Write something...",
                            border: InputBorder.none,
                          ),
                          autofocus: false,
                          style: const TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 19, 19, 19)),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Get.width,
                      height: 30.0,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        "Image",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _showImagePicker();
                      },
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                            // style: BorderStyle.dashed,
                          ),
                          shape: BoxShape.rectangle,
                        ),
                        child: Center(
                          child: _imageFile != null
                              ? Image.file(_imageFile!)
                              : const Text(
                                  '+',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 100.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back(canPop: true);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.white),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(5.0),
                              ),
                            ),
                            width: Get.width / 3,
                            height: 50,
                            child: const Center(
                              child: Text("Cancel",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600)),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            try {
                              var nameValue = name.text.trim();
                              var descriptionValue = description.text.trim();
                              // print("0000000000 $nameValue $descriptionValue ");
                              if (nameValue.isNotEmpty ||
                                  descriptionValue.isNotEmpty) {
                                accomodation.createAccommodation(
                                  nameValue,
                                  descriptionValue,
                                  _imageFile!,
                                  const GeoPoint(
                                      30.357084347294474, 76.75669827448608),
                                );
                                print(
                                    "0000000000 $nameValue $descriptionValue ");
                              }
                            } catch (e) {
                              print("000000000000000000 $e");
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromARGB(255, 53, 52, 52),
                                    blurRadius: 2.0,
                                    spreadRadius: 0.3)
                              ],
                              color: constants.whiteBackground,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(5.0),
                              ),
                            ),
                            width: Get.width / 3,
                            height: 50,
                            child: const Center(
                              child: Text("Submit",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600)),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
