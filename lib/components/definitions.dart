import 'package:flutter/material.dart';
import 'package:gre_vocab_synonyms/components/similar.dart';

class Definitions extends StatelessWidget {
  String definition = "";
  String example = "";
  List synonyms = [];
  List antonyms = [];
  Definitions(
      {required this.definition,
      required this.example,
      required this.synonyms,
      required this.antonyms});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0, bottom: 10.0),
          child: Text('$definition'),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, bottom: 10.0),
          child: Text('eg: $example'),
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
