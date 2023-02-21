import 'dart:developer';

import 'package:http/http.dart' as http;

import 'dart:convert';

import '../../models/registration_model.dart';

Future<Registered?> register(
    String email, String password, String phone, String profile) async {
  var response = await http.post(
    Uri.parse("http://43.207.160.124/registration/"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
      <String, String>{
        "email": email,
        "password": password,
        "phone": phone,
        "profile": profile
      },
    ),
  );
  if (response.statusCode == 200) {
    log(jsonDecode(response.body));
    return Registered.fromJson(
      jsonDecode(response.body),
    );
  } else {
    log(
      response.reasonPhrase.toString(),
    );
    return null;
  }
}
