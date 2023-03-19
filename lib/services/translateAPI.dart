import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/translatedModel.dart';

bool toChange = false;
List<String> contentOfTheAppFromBackend = [];
String? particularLine;

Future<TranslatedData?> translateTo(
    String targetLang, List<String> contentToBeTranslated) async {
  for (var string in contentOfTheAppFromBackend) {
    particularLine = string;
  }
  var response = await http.post(
      Uri.parse(
          "https://google-translate1.p.rapidapi.com/language/translate/v2"),
      headers: {
        'Content-Type': "application/x-www-form-urlencoded",
        'Accept-Encoding': 'application/gzip',
        'X-RapidAPI-Key': '228b639b3bmsha3d5a2853287f8fp12033djsn1ec5e589b9bc',
        'X-RapidAPI-Host': 'google-translate1.p.rapidapi.com'
      },
      body: jsonEncode({'q': particularLine, 'target': targetLang}));
  if (response.statusCode == 200) {
    return TranslatedData.fromJson(jsonDecode(response.body));
  } else {
    return null;
  }
}
