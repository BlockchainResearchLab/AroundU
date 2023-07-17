import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/jobFeedForWorkerModel.dart';

class JobDetailsForWorker {
  Future<JobsFeedForWorkerModel> getJobsForWorker(
    String token,
    String email,
  ) async {
    var response = await http
        .get(Uri.parse("http://13.231.10.139:5000/view_all_jobs"), headers: {
      'token': token,
      'email': email,
    });

    if (response.statusCode == 200) {
      return JobsFeedForWorkerModel.fromJson(jsonDecode(response.body));
    } else {
      return JobsFeedForWorkerModel.fromJson(jsonDecode(response.body));
    }
  }
}
