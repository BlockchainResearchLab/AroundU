import 'dart:convert';

import '../../models/login_model.dart';
import 'package:http/http.dart' as http;

Future<Login?> login(String username, String password) async {
  var response = await http.post(Uri.parse("http://43.207.160.124/login/"),
      body: {"username": username, "password": password});

  if (response.statusCode == 200) {
    print(response.body);
    return Login.fromJson(jsonDecode(response.body));
  } else {
    return null;
  }
}
