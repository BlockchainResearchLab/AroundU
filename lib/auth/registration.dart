import 'package:flutter/material.dart';
import 'package:tech_sprint_hackathon/auth/login.dart';
import 'package:tech_sprint_hackathon/auth/otp_screen.dart';

import '../Routes/routes.dart';
import '../constants/constants.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/widgets/buttons.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: <Widget>[
              const Header(),
              const SizedBox(
                height: 24,
              ),
              Center(
                child: Text(
                  "Welcome",
                  style: GoogleFonts.inter(
                      color: const Color(0xff5a5a5a),
                      fontWeight: FontWeight.bold,
                      fontSize: 23),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                "Register for your account",
                style: GoogleFonts.inter(
                    color: const Color(0xffa9aaaa),
                    fontWeight: FontWeight.w200,
                    fontSize: 23),
              ),
              Image.asset(ImageLink.reg),
              const SizedBox(
                height: 23,
              ),
              const TextfieldWidget(
                hintlines: "enter your email",
                prefixIcon: Icon(Icons.account_circle_rounded),
              ),
              const TextfieldWidget(
                hintlines: "mobile number",
                prefixIcon: Icon(Icons.call_rounded),
              ),
              const TextfieldWidget(
                hintlines: "password",
                prefixIcon: Icon(Icons.lock_outline),
              ),
              const SizedBox(
                height: 23,
              ),
              FooterButton(
                buttonName: "Register",
                pushToPage: () {
                  Navigator.pushReplacementNamed(context, Routes.OTPScreen);
                },
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 23,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?  ",
                    style: GoogleFonts.inter(
                      color: Color(0xff565656),
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.black,
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) {
                          return const LoginScreen();
                        },
                      ));
                    },
                    child: Text(
                      "Login",
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
