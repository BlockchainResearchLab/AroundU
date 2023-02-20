import 'package:http/http.dart' as http;

import 'dart:convert';

import '../../models/otp_model.dart';
import '../../models/registration_model.dart';

Future<OTP?> verifyOTP(String phone) async {
  var response = await http.post(
    Uri.parse("http://43.207.160.124/sendotp/"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{"phone": phone}),
  );
  if (response.statusCode == 200) {
    print(jsonDecode(response.body));
    return OTP.fromJson(jsonDecode(response.body));
  } else {
    print(response.reasonPhrase);
    return null;
  }
}
