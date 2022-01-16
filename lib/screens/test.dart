// ignore_for_file: avoid_print
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart' show rootBundle;

const apiURL = "https://api.dictionaryapi.dev/api/v2/entries/en";
String word = "";
String audio = "";
AudioPlayer audioPlayer = AudioPlayer();

//  final response = await http.get(Uri.parse('$url/abate'));

void getData() async {
  http.Response response = await http.get(Uri.parse('$apiURL/sustain'));
  if (response.statusCode == 200) {
    String data = response.body;

    word = jsonDecode(data)[0]['word'];
    String phonetics = jsonDecode(data)[0]['phonetics'][0]['text'];
    audio = jsonDecode(data)[0]['phonetics'][0]['audio'];
    List meanings = jsonDecode(data)[0]['meanings'];
    //print(meanings);
    //print(word);
    //print(audio);
  } else {
    print(response.statusCode);
  }
}

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  void initState() {
    super.initState();
    fetchFileData();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0B0C10),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color(0xFF0B0C10),
        ),
        title: Text(
          "Vocab + Synonyms",
          style: TextStyle(),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: IconButton(
          color: Color(0xff66FCF1),
          iconSize: 35.0,
          splashColor: Color(0xff66FCF1),
          padding: EdgeInsets.all(10.0),
          icon: const Icon(Icons.volume_up),
          //audio should be played
          onPressed: () async {
            await audioPlayer.play('https:$audio');
          },
        ),
      ),
    );
  }
}

fetchFileData() async {
  String fileData = await rootBundle.loadString('assets/word_list.txt');
  List wordList = json.decode(fileData);
  String word = wordList[0];
}
