import 'dart:developer';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../models/otp_model.dart';

Future<OTP?> verifyOTP(String phone) async {
  var response = await http.post(
    Uri.parse("http://18.182.46.196/sendotp/"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{"phone": phone},),
  );
  if (response.statusCode == 200) {
    return OTP.fromJson(jsonDecode(response.body),);
  } else {
    log(response.reasonPhrase.toString());
    return null;
  }
}
