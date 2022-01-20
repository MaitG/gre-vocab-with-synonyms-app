// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gre_vocab_synonyms/components/deck.dart';

int deckNo = 0;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void fetchDeck() async {
    String fileData = await rootBundle.loadString('assets/word_list.json');
    setState(() {
      var wordList = json.decode(fileData);
      deckNo = wordList.length;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchDeck();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF0B0C10),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color(0xFF0B0C10),
          ),
          title: Text(
            "Vocab + Synonyms",
            style: TextStyle(
              color: Color(0xff66FCF1),
            ),
          ),
          centerTitle: true,
        ),
        //Body
        body: SingleChildScrollView(
          child: Column(
            children: [
              for (int i = 1; i <= deckNo; i++) DeckCard(number: i),
            ],
          ),
        ));
  }
}
