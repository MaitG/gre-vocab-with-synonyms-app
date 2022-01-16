// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:gre_vocab_synonyms/components/similar.dart';

class Meanings extends StatelessWidget {
  String partOfSpeech;
  String definition;
  String example;
  List synonyms;
  List antonyms;

  Meanings({
    required this.partOfSpeech,
    required this.synonyms,
    required this.antonyms,
    required this.example,
    required this.definition,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ignore: prefer_const_constructors
        Padding(
          padding: const EdgeInsets.only(left: 10.0, bottom: 10.0),
          child: Text('$partOfSpeech'),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, bottom: 10.0),
          child: Text('$definition'),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, bottom: 10.0),
          child: Text('$example'),
        ),

        Similar(
          title: "Synonyms",
          related_words: synonyms,
        ),
        //Opposites
        Similar(
          title: "Antonyms",
          related_words: antonyms,
        ),
        Divider(
          color: Color(0xffC5C6C7),
        ),
        SizedBox(
          height: 6.0,
        )
      ],
    );
  }
}
