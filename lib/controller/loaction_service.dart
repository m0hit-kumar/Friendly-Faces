import 'dart:convert';
import 'package:http/http.dart' as http;

Future<http.Response> getLocationData(String text) async {
  http.Response response;
  print("0000000000000 inside api");

  Uri uri = Uri.https("maps.googleapis.com", "maps/api/place/autocomplete/json",
      {"input": text, "key": ""});
  response = await http.get(uri);
  print("000000000000000000 response$response");

  print("000000000000000000 json${jsonDecode(response.body)}");
  return response;
}
