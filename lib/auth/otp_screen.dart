import 'package:flutter/material.dart';
import 'package:tech_sprint_hackathon/auth/registration.dart';

import '../Routes/routes.dart';
import '../constants/constants.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/widgets/buttons.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: <Widget>[
              const Header(),
              const SizedBox(
                height: 30,
              ),
              Image.asset(
                ImageLink.otp,
                scale: 3,
              ),
              const SizedBox(
                height: 24,
              ),
              Center(
                child: Text(
                  "Enter the OTP send to\n your Phone Number",
                  style: GoogleFonts.inter(
                      color: const Color(0xff5a5a5a),
                      fontWeight: FontWeight.bold,
                      fontSize: 23),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              OtpTextField(
                focusedBorderColor: AppTheme.shadowColor,
                cursorColor: AppTheme.primaryColor,
                borderRadius: BorderRadius.circular(15),
                numberOfFields: 4,
                borderColor: const Color(0xfff0f0f0),
                showFieldAsBox: true,
                onCodeChanged: (String code) {},
                onSubmit: (String verificationCode) {
                  null;
                }, // end onSubmit
              ),
              const SizedBox(
                height: 23,
              ),
              FooterButton(
                buttonName: "LOG IN",
                pushToPage: () => Routes.ProfileChoose,
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 23,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?  ",
                    style: GoogleFonts.inter(
                      color: Color(0xff565656),
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.black,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegistrationPage(),
                        ),
                      );
                    },
                    child: Text(
                      "Register",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        color: Color(0xff0476ff),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TextfieldWidget extends StatelessWidget {
  // controllers yet to be implemented.....
  const TextfieldWidget(
      {super.key, required this.hintlines, required this.prefixIcon});
  final String hintlines;
  final Icon prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        decoration: InputDecoration(
            prefixIcon: prefixIcon,
            hintStyle: GoogleFonts.inter(color: Color(0xff565656)),
            hintText: hintlines,
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.5)),
            enabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.5))),
      ),
    );
  }
}
