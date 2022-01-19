// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:gre_vocab_synonyms/screens/home_screen.dart';
// ignore: unused_import
import 'package:gre_vocab_synonyms/screens/test.dart';
import 'package:gre_vocab_synonyms/screens/word_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Vocab + Synonyms",
      darkTheme: ThemeData(brightness: Brightness.dark),
      initialRoute: 'homeScreen',
      routes: {
        'homeScreen': (context) => HomeScreen(),
        'wordScreen': (context) => WordScreen()
      },
    );
  }
}
