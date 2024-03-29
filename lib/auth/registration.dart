import 'dart:developer';

import 'package:flutter/material.dart';

import '../Routes/routes.dart';
import '../constants/constants.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/widgets/buttons.dart';
import '../models/otp_model.dart';
import '../services/auth-api-service/otp_api.dart';

String? email;
String? phone;
String? password;
String? otpRecieved;

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(),
          const SizedBox(
            width: 10,
          ),
          Container(
            margin: const EdgeInsets.only(left: 7),
            child: const Text("Logging in..."),
          ),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

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
              Image.asset(ImageLink.reg, scale: 4.5),
              const SizedBox(
                height: 23,
              ),
              TextFieldWidget(
                controller: emailController,
                hintLines: "enter your email",
                prefixIcon: const Icon(Icons.account_circle_rounded),
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              TextFieldWidget(
                controller: phoneController,
                hintLines: "mobile number",
                prefixIcon: const Icon(Icons.call_rounded),
                onChanged: (value) {
                  setState(() {
                    phone = value;
                  });
                },
              ),
              TextFieldWidget(
                controller: passwordController,
                hintLines: "password",
                prefixIcon: const Icon(Icons.lock_outline),
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
              ),
              const SizedBox(
                height: 23,
              ),
              FooterButton(
                  buttonName: "Register",
                  pushToPage: () async {
                    if (email == null || phone == null || password == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please provide all the details"),
                        ),
                      );
                    } else {
                      Future.delayed(const Duration(seconds: 1), () {
                        showLoaderDialog(context);
                      });
                      OTP? otpFromBackend = await verifyOTP(phone!);
                      setState(() {
                        otpRecieved = otpFromBackend!.otp;
                      });
                      log(otpRecieved!);
                      // log(otpTyped!);
                      Navigator.pop(context);
                      Navigator.pushNamed(context, Routes.OTPScreen);
                    }
                  }),
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
                      color: const Color(0xff565656),
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.black,
                    onTap: () {
                      Navigator.pushReplacementNamed(
                        context,
                        Routes.LoginScreen,
                      );
                    },
                    child: Text(
                      "Login",
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

class TextFieldWidget extends StatelessWidget {
  // controllers yet to be implemented.....
  const TextFieldWidget(
      {super.key,
      required this.hintLines,
      required this.prefixIcon,
      required this.controller,
      required this.onChanged});

  final String hintLines;
  final Icon prefixIcon;
  final TextEditingController controller;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      child: TextFormField(
        onChanged: onChanged,
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          hintStyle: GoogleFonts.inter(
            color: const Color(0xff565656),
          ),
          hintText: hintLines,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
