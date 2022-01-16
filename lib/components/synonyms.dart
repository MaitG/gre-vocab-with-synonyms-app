import 'package:flutter/material.dart';

class synonyms extends StatelessWidget {
  String word;
  synonyms({required this.word});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1.0, vertical: 1.0),
      child: Container(
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xff66FCF1), width: 1),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Text("$word"),
      ),
    );
  }
}
