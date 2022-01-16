// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gre_vocab_synonyms/components/word.dart';
import 'package:flutter/services.dart' show rootBundle;

int counter = 0;
String currentWord = "";

class WordScreen extends StatefulWidget {
  @override
  _WordScreenState createState() => _WordScreenState();
}

class _WordScreenState extends State<WordScreen> {
  void getCurrentWord() async {
    String fileData = await rootBundle.loadString('assets/word_list.txt');
    List wordList = json.decode(fileData);
    if (counter <= 0 || counter >= 30) {
      counter = 0;
    }
    currentWord = wordList[counter];
    print(currentWord);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0B0C10),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color(0xFF0B0C10),
        ),
        title: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {},
            ),
            Text(
              "Vocab + Synonyms",
              style: TextStyle(),
            )
          ],
        ),
      ),
      //Body
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              //The word Card
              Word(
                currentWord: currentWord,
              ),
              //Next or Previous Card Button
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xff45A29E),
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Color(0xff45A29E), width: 1),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          color: Colors.black,
                          iconSize: 25.0,
                          // splashColor: Color(0xff66FCF1),
                          padding: EdgeInsets.all(10.0),
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () {
                            if (counter <= 0) {
                              counter = 0;
                            }
                            counter--;
                            setState(() {
                              getCurrentWord();
                            });
                          },
                        ),
                        SizedBox(
                          width: 100.0,
                        ),
                        TextButton(
                          onPressed: () {},
                          //Counter for the cards
                          child: Text(
                            "12/30",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        SizedBox(
                          width: 100.0,
                        ),
                        IconButton(
                          color: Colors.black,
                          iconSize: 25.0,
                          // splashColor: Color(0xff66FCF1),
                          padding: EdgeInsets.all(10.0),
                          icon: const Icon(Icons.arrow_forward),
                          onPressed: () {
                            counter++;
                            setState(() {
                              getCurrentWord();
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
