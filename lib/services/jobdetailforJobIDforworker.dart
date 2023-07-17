import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/jobDetailForJobIDModel.dart';

Future<JobDetailsForJobIDModel?> getJobDetailforWorker(
    String token, String email, String jobID) async {
  var response = await http.get(
    Uri.parse("http://18.181.248.183:5000/view_job/$jobID"),
    headers: {'token': token, 'email': email},
  );
  if (response.statusCode == 200) {
    return JobDetailsForJobIDModel.fromJson(jsonDecode(response.body));
  }
}
