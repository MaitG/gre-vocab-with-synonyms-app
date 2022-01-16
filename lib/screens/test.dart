// // ignore_for_file: avoid_print
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:http/http.dart' as http;
// import 'package:audioplayers/audioplayers.dart';

// //const apiURL = "https://api.dictionaryapi.dev/api/v2/entries/en";

// String word = "";
// String audio = "";
// AudioPlayer audioPlayer = AudioPlayer();

// //  final response = await http.get(Uri.parse('$url/abate'));

// class TestScreen extends StatefulWidget {
//   @override
//   _TestScreenState createState() => _TestScreenState();
// }

// class _TestScreenState extends State<TestScreen> {
//   // @override
//   // void initState() {
//   //   super.initState();
//   //   fetchFileData();
//   //   getData();
//   // }
//   // @override
//   // void initState() {
//   //   super.initState();
//   // }

//   // void getWordData() async {
//   //   NetworkHelper networkHelper = NetworkHelper('$apiURL/abate');
//   //   var wordData = await networkHelper.getData();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xFF0B0C10),
//         systemOverlayStyle: SystemUiOverlayStyle(
//           statusBarColor: Color(0xFF0B0C10),
//         ),
//         title: Text(
//           "Vocab + Synonyms",
//           style: TextStyle(),
//         ),
//         centerTitle: true,
//       ),
//       body: SafeArea(
//         child: IconButton(
//           color: Color(0xff66FCF1),
//           iconSize: 35.0,
//           splashColor: Color(0xff66FCF1),
//           padding: EdgeInsets.all(10.0),
//           icon: const Icon(Icons.volume_up),
//           //audio should be played
//           onPressed: () async {
//             await audioPlayer.play('https:$audio');
//           },
//         ),
//       ),
//     );
//   }
// }

// fetchFileData() async {
//   String word = wordList[0];
// }
