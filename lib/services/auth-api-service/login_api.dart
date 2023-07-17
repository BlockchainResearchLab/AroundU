import 'dart:convert';
import 'dart:developer';
import '../../models/login_model.dart';
import 'package:http/http.dart' as http;

Future<Login?> login(String username, String password) async {
  var response = await http.post(Uri.parse("http://18.182.46.196/login/"),
      body: {"username": username, "password": password});

  if (response.statusCode == 200) {
    log(response.body);
    return Login.fromJson(
      jsonDecode(response.body),
    );
  } else {
    return null;
  }
}
