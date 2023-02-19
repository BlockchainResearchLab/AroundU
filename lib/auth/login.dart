import 'package:flutter/material.dart';
import 'package:tech_sprint_hackathon/auth/registration.dart';

import '../Routes/routes.dart';
import '../constants/constants.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/widgets/buttons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: <Widget>[
              const Header(),

              Image.asset(ImageLink.login),
              const SizedBox(
                height: 24,
              ),
              Center(
                child: Text(
                  "Welcome Back!",
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
                "Log in to your existing account",
                style: GoogleFonts.inter(
                    color: const Color(0xffa9aaaa),
                    fontWeight: FontWeight.w200,
                    fontSize: 23),
              ),

              const SizedBox(
                height: 23,
              ),
              const TextfieldWidget(
                hintlines: "enter your email",
                prefixIcon: Icon(Icons.account_circle_rounded),
              ),

              const TextfieldWidget(
                hintlines: "password",
                prefixIcon: Icon(Icons.lock_outline),
              ),
              const SizedBox(
                height: 23,
              ),
              FooterButton(
                buttonName: "LOG IN",
                pushToPage: () =>
                    Navigator.pushReplacementNamed(context, Routes.OTPScreen),
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
                      color: const Color(0xff565656),
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.black,
                    onTap: () {
                      Navigator.pushReplacementNamed(
                        context,
                        Routes.RegistrationScreen,
                      );
                    },
                    child: Text(
                      "Register",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff0476ff),
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
