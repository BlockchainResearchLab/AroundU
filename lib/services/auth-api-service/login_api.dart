import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../models/login_model.dart';

Future<Login?> login(String email, String password) async {
  var headers = {'Content-Type': 'application/json'};
  var request = http.Request('POST', Uri.parse('http://43.207.160.124/login/'));
  request.body = json.encode({"username": email, "password": password});
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
    var jsontoken = response.stream.bytesToString();
    return Login.fromJson(jsonDecode(jsontoken as String));
  } else {
    print(response.reasonPhrase);
  }
}
