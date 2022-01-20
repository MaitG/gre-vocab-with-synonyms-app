import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:gre_vocab_synonyms/screens/home_screen.dart';

class DeckCard extends StatefulWidget {
  int number;
  DeckCard({required this.number});

  @override
  State<DeckCard> createState() => _DeckCardState();
}

class _DeckCardState extends State<DeckCard> {
  List deck = [];
  Future<List> deckData(int deckNo) async {
    String fileData = await rootBundle.loadString('assets/word_list.json');
    var wordList = json.decode(fileData);
    setState(() {
      String x = "Group $deckNo";
      print(x);
      deck = wordList["Group 4"];
      int list_len = deck.length;
    });
    return deck;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: 140.0,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: Color(0xff45A29E), width: 1.5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Deck ${widget.number}",
                //the word text goes here
                style: TextStyle(fontSize: 38.0, color: Color(0xff66FCF1)),
              ),
              IconButton(
                onPressed: () async {
                  var data = await deckData(widget.number);
                  Navigator.pushNamed(context, 'wordScreen',
                      arguments: {'wordList': deck});
                },
                icon: Icon(Icons.arrow_forward_ios),
                color: Color(0xff66FCF1),
                iconSize: 57.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
