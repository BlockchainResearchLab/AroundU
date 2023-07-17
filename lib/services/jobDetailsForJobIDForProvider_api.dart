import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/jobDetailsOfJobIDForProviderModel.dart';

class JobDetailsForJobID {
  Future<JobDetailsOfJobIDForProvider?> getDetailsForJobID(
    String jobId,
    String token,
    String email,
  ) async {
    var res = await http.get(
        Uri.parse("http://13.231.10.139:5000/view_job_details/$jobId"),
        headers: {"token": token, "email": email});
    if (res.statusCode == 200) {
      return JobDetailsOfJobIDForProvider.fromJson(jsonDecode(res.body));
    } else {
      return null;
    }
  }
}
