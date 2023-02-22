import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tech_sprint_hackathon/auth/profile_option.dart';

import '../models/job_create_model.dart';

Future<void> createJob(
  String title,
  String description,
  String type,
  int price,
  String latitude,
  String longitude,
  String token,
  String state,
  String email,
  String due_date,
  String start_date,
) async {
  var response = await http.post(
      Uri.parse("http://18.181.248.183:5000/create_job"),
      headers: {
        'token': token,
        'email': email,
        'Content-Type': 'application/json'
      },
      body: jsonEncode({
        "title": title,
        "description": description,
        "type": type,
        "price": price,
        "latitude": latitude,
        "longitude": longitude,
        "due_date": due_date,
        "start_date": start_date,
        "state": state,
      }));

  if (response.statusCode == 200 ||
      response.statusCode == 302 ||
      response.statusCode == 100) {
    print(response.body);
    print(response.statusCode);
  } else {
    return null;
  }
}
