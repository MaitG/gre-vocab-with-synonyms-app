// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:gre_vocab_synonyms/components/meanings.dart';
import 'package:audioplayers/audioplayers.dart';

class Word extends StatelessWidget {
  Word(
      {required this.currentWord,
      required this.phonetics,
      required this.audio,
      required this.meanings});
  String currentWord;
  String phonetics;
  String audio;
  List meanings;

  @override
  Widget build(BuildContext context) {
    AudioPlayer audioPlayer = AudioPlayer();
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: Color(0xff66FCF1), width: 1),
        ),
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 1.0),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Color(0xff66FCF1), width: 1),
                      // color: Color(0xff66FCF1),
                    ),
                    //Add the audio url to this button
                    child: IconButton(
                      color: Color(0xff66FCF1),
                      iconSize: 35.0,
                      splashColor: Color(0xff66FCF1),
                      padding: EdgeInsets.all(10.0),
                      icon: const Icon(Icons.volume_up),
                      //audio should be played
                      onPressed: () async {
                        print(meanings);
                        await audioPlayer.play('https:$audio');
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      //the word text goes here
                      currentWord,
                      style: TextStyle(fontSize: 45.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      //the word phonetic goes here
                      child: Text("/$phonetics/"),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 15.0,
            ),

            //the meaning is decoded here
            Meanings(
              partOfSpeech: 'verb',
              synonyms: ["1", "2", "3"],
              antonyms: ["5", "6", "7"],
              definition:
                  '(of something unpleasant or severe) become less intense or widespread."the storm suddenly abated"',
              example: "used in a sentence",
            ),
            Meanings(
                partOfSpeech: 'noun',
                definition:
                    '(of something unpleasant or severe) become less intense or widespread."the storm suddenly abated"',
                example: "used in a sentence",
                synonyms: ["1", "2", "3"],
                antonyms: ["5", "6", "7"]),
          ],
        ),
      ),
    );
  }
}
