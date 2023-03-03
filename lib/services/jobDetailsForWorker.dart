import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/JobDetailsForWorkerFeedModel.dart';

Future<JobDetailsForWorkerFeedModel?> getJobsForWorkers(
    String token, String email) async {
  var response = await http.get(
    Uri.parse("http://18.181.248.183:5000/view_all_jobs"),
    headers: {
      'token': token,
      'email': email,
    },
  );
  if (response.statusCode == 200) {
    return JobDetailsForWorkerFeedModel.fromJson(jsonDecode(response.body));
  } else {
    return null;
  }
}
