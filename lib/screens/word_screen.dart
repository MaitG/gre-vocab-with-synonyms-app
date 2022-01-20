// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, non_constant_identifier_names
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gre_vocab_synonyms/components/word.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:gre_vocab_synonyms/services/word_data.dart';
import 'package:flip_card/flip_card.dart';

class WordScreen extends StatefulWidget {
  WordScreen({this.wordDef});
  final wordDef;
  @override
  _WordScreenState createState() => _WordScreenState();
}

class _WordScreenState extends State<WordScreen> {
  WordDataModel wordDataModel = WordDataModel();

  String word = "";
  String apiWord = "";
  int counter = 0;
  int total_words = 0;
  String currentWord = "";
  String audio = "";
  String phonetics = "";
  List meanings = [];
  @override
  void initState() {
    super.initState();
    getCurrentWord();
    updateUI(widget.wordDef);
  }

  void getCurrentWord() async {
    String fileData = await rootBundle.loadString('assets/word_list.txt');
    List wordList = json.decode(fileData);
    total_words = wordList.length;
    if (counter <= 0 || counter >= total_words) {
      counter = 0;
    }
    setState(() {
      word = wordList[counter];
      getWordData(word);
    });
  }

  void getWordData(word) async {
    var something = await wordDataModel.getWordData(word);
    updateUI(something);
  }

  //void getCurrentWordData(String word) {}
  void updateUI(dynamic wordData) {
    if (this.mounted) {
      setState(() {
        if (wordData == null) {
          String audio = "";
          String phonetics = "";
          List meanings = [];
          return;
        }
        apiWord = wordData[0]['word'];
        audio = wordData[0]['phonetics'][0]['audio'];
        phonetics = wordData[0]['phonetics'][0]['text'];
        meanings = wordData[0]['meanings'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    if (arguments != null) print(arguments);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF0B0C10),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color(0xFF0B0C10),
        ),
        title: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
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
              FlipCard(
                back: Word(
                  currentWord: word,
                  phonetics: phonetics,
                  audio: audio,
                  meanings: meanings,
                ),
                front: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: 600.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(color: Color(0xff66FCF1), width: 1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Center(
                        child: Text(
                          //the word text goes here
                          word,
                          style: TextStyle(fontSize: 45.0),
                        ),
                      ),
                    ),
                  ),
                ),
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
                            "${counter + 1}/$total_words",
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
