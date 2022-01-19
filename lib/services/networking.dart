import 'dart:convert';
import 'package:http/http.dart' as http;

//const apiURL = "https://api.dictionaryapi.dev/api/v2/entries/en";

class NetworkHelper {
  NetworkHelper(this.url);
  final String url;

  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));
    //print("WordData");
    //print(url);

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
