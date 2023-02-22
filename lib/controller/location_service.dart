import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LocationService extends GetxController {
  Future<List> getSuggestion(String input) async {
    List data = [];
    var text = input == "" ? "" : input;
    String request =
        "https://api.openrouteservice.org/geocode/search?api_key=5b3ce3597851110001cf6248ad701dfd37ee452da0fb1e53494f9adb&text=$text&boundary.country=IND";
    var response = await http.get(Uri.parse(request), headers: {
      'Accept':
          'application/json, application/geo+json, application/gpx+xml, img/png; charset=utf-8'
    });
    if (response.statusCode == 200) {
      var placeList = jsonDecode(response.body.toString())['features'];
      for (var element in placeList) {
        data.add({
          "loc": {
            "lat": element["geometry"]["coordinates"][0],
            "long": element["geometry"]["coordinates"][1]
          },
          "name": element["properties"]["label"]
        });
      }
    }
    // print("0000000000000 $data");
    return data;
  }

  Future<Position> determinePosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    LocationPermission permission;

    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
    }

    do {
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw Exception('Location permissions are denied');
        }
      }
    } while (permission == LocationPermission.denied);

    if (permission == LocationPermission.deniedForever) {
      throw Exception(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    var loc = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return loc;
  }
}
