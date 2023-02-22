import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tech_sprint_hackathon/auth/profile_option.dart';

import '../models/job_create_model.dart';

Future<JobCreateModel?> createJob(
    String title,
    String description,
    String type,
    String price,
    String latitude,
    String logitude,
    String token,
    String email) async {
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
        "type": type, //electrician
        "price": price,
        "latitude": latitude,
        "longitude": logitude
      }));
  if (response.statusCode == 200) {
    return JobCreateModel.fromJson(jsonDecode(response.body));
  } else {
    return null;
  }
}
