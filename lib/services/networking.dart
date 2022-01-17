import 'dart:convert';
import 'package:http/http.dart' as http;

//const apiURL = "https://api.dictionaryapi.dev/api/v2/entries/en";

class NetworkHelper {
  NetworkHelper(this.url);
  final String url;

  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));
    print("WordData");
    print(url);

    if (response.statusCode == 200) {
      String data = response.body;
      //word = jsonDecode(data)[0]['word'];
      //String phonetics = jsonDecode(data)[0]['phonetics'][0]['text'];
      //audio = jsonDecode(data)[0]['phonetics'][0]['audio'];
      //List meanings = jsonDecode(data)[0]['meanings'];
      //print(meanings);
      //print(word);
      //print(audio);
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
