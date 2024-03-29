import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/JobDetailsForProviderFeedModel.dart';

class JobDetails {
  Future<JobDetailsForProviderFeedModel> getJobsForProvider(
    String token,
    String email,
  ) async {
    var response = await http.get(
        Uri.parse("http://13.231.10.139:5000/view_created_jobs"),
        headers: {
          'token': token,
          'email': email,
        });

    if (response.statusCode == 200) {
      return JobDetailsForProviderFeedModel.fromJson(jsonDecode(response.body));
    } else {
      return JobDetailsForProviderFeedModel.fromJson(jsonDecode(response.body));
    }
  }
}
