// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gre_vocab_synonyms/components/deck.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              DeckCard(
                number: 1,
              ),
              DeckCard(
                number: 2,
              ),
              DeckCard(
                number: 3,
              ),
              DeckCard(
                number: 4,
              ),
            ],
          ),
        ));
  }
}
