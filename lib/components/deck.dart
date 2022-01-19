import 'package:flutter/material.dart';

class DeckCard extends StatelessWidget {
  int number;
  DeckCard({required this.number});

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
                "Deck $number",
                //the word text goes here
                style: TextStyle(fontSize: 38.0, color: Color(0xff66FCF1)),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'wordScreen');
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
