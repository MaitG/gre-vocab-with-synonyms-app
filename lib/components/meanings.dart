// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:gre_vocab_synonyms/components/definitions.dart';
import 'package:gre_vocab_synonyms/components/similar.dart';

class Meanings extends StatelessWidget {
  String partOfSpeech;
  List definitions;

  Meanings({
    required this.partOfSpeech,
    required this.definitions,
  });

  @override
  Widget build(BuildContext context) {
    // String defintion = definitions[0]['definition'];
    // String example = definitions[0]['example'];
    // List synonyms = definitions[0]['synonyms'];
    // List antonyms = definitions[0]['antonyms'];
    int total_definitions = definitions.length;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ignore: prefer_const_constructors
        Padding(
          padding: const EdgeInsets.only(left: 10.0, bottom: 10.0),
          child: Text('$partOfSpeech'),
        ),
        // Definitions(
        //     definition: defintion,
        //     example: example,
        //     synonyms: synonyms,
        //     antonyms: antonyms),
        for (int i = 0; i < total_definitions; i++)
          Definitions(
            definition: definitions[i]['definition'] ?? "",
            antonyms: definitions[i]['antonyms'],
            example: definitions[i]['example'] ?? "",
            synonyms: definitions[i]['synonyms'],
          ),
        // Divider(
        //   color: Color(0xffC5C6C7),
        // ),
        // SizedBox(
        //   height: 6.0,
        // )
      ],
    );
  }
}
