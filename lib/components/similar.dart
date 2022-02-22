// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:gre_vocab_synonyms/components/synonyms.dart';

class Similar extends StatelessWidget {
  String title;
  var related_words;

  Similar({required this.title, required this.related_words});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, bottom: 10.0),
      child: Wrap(
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 6.0, right: 5.0),
            child: Text(
              '$title:',
              style: TextStyle(
                  color: '$title' == "Synonyms"
                      ? Colors.greenAccent
                      : Colors.redAccent.shade100),
            ),
          ),
          for (var word in related_words) synonyms(word: '$word'),
        ],
      ),
    );
  }
}
