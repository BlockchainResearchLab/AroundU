import 'package:http/http.dart' as http;
import 'package:tech_sprint_hackathon/auth/profile_option.dart';
import 'dart:convert';

import '../../models/worker_profile_model.dart';

Future<WorkerProfileModel?> workerDetails(
    String name, String address, List<String> tags) async {
  var response = await http.post(
      Uri.parse("http://18.182.46.196/jobworkerprofile/"),
      headers: {
        'Authorization': 'token $token ',
        'Content-Type': 'application/json'
      },
      body: jsonEncode(<String, dynamic>{
        "name": name,
        "location": address,
        "skills": tags,
      }));
  if (response.statusCode == 200) {
    print("workerFeedDataSend " + response.statusCode.toString());
    return WorkerProfileModel.fromJson(jsonDecode(response.body));
  } else {
    return null;
  }
}
