// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class CurrentWord {
  late String currentWord;

  Future<String> getCurrentWord() async {
    int total_words = 0;
    int counter = 0;
    String fileData = await rootBundle.loadString('assets/word_list.txt');
    List wordList = json.decode(fileData);
    total_words = wordList.length;
    if (counter <= 0 || counter >= total_words) {
      counter = 0;
    }
    currentWord = wordList[counter];
    return currentWord;
  }
}
