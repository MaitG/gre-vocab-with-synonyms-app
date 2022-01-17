// ignore_for_file: non_constant_identifier_names

import 'package:gre_vocab_synonyms/services/networking.dart';

const apiURL = "https://api.dictionaryapi.dev/api/v2/entries/en";

class WordDataModel {
  Future<dynamic> getWordData(String currentWord) async {
    NetworkHelper networkHelper = NetworkHelper('$apiURL/$currentWord');
    var WordData = await networkHelper.getData();
    return WordData;
  }
}
