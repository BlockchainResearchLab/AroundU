import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:developer';

Future<void> createJob({
  required String token,
  required String email,
  required String title,
  required String description,
  required String type,
  required int price,
  required String latitude,
  required String longitude,
  required String state,
  required String due_date,
  required String start_date,
}) async {
  var res = await http.post(Uri.parse("http://13.231.10.139:5000/create_job"),
      headers: {
        'token': token,
        'email': email,
        // 'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
      body: jsonEncode({
        "title": title,
        "description": description,
        "type": type,
        "price": price,
        "latitude": latitude,
        "longitude": longitude,
        "state": state,
        "due_date": due_date,
        "start_date": start_date
      }));
  if (res.statusCode == 200 || res.statusCode == 302) {
    // print(res.body.toString());
    log(res.statusCode.toString());
  } else {
    print(res.statusCode);
  }
}
