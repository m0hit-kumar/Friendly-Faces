import 'dart:convert';
import 'package:friendly_faces/controller/loaction_service.dart';
import 'package:get/get.dart';

import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_webservice/src/places.dart';

class LocationController extends GetxController {
  final Placemark _pickPlaceMark = Placemark();
  Placemark get pickPlaceMark => _pickPlaceMark;

  List<Prediction> _predictionList = [];
  Future<List<Prediction>> searchLocation(
      BuildContext context, String text) async {
    if (text != '' && text.isNotEmpty) {
      print("0000000000000text0 $text");

      http.Response response = await getLocationData(text);
      print("00000000000000 $response");

      var data = jsonDecode(response.body.toString());
      print("00000000000000 $data");
      print("my status is  ${data["status"]}");
      if (data['status'] == 'OK') {
        print("00000000000000 ok");
        _predictionList = [];
        data['predictions'].forEach((prediction) =>
            _predictionList.add(Prediction.fromJson(prediction)));
      } else {
        print("00000000000000000000000 apicheck");
        // ApiChecker.checkApi(response);
      }
    }
    return _predictionList;
  }
}
