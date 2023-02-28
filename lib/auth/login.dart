import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tech_sprint_hackathon/auth/profile_option.dart';
import 'package:tech_sprint_hackathon/auth/registration.dart';
import 'package:tech_sprint_hackathon/services/auth-api-service/login_api.dart';

import '../Routes/routes.dart';
import '../constants/constants.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/widgets/buttons.dart';
import '../models/login_model.dart';
import 'package:http/http.dart' as http;

String? loggedEmail;
String? password;
String? isSuccess = "false";

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
  void initState() {
    super.initState();
    emailController.addListener(_printLatestUsername);
    passwordController.addListener(_printLatestPassword);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    emailController.dispose();
    passwordController.dispose();
    showLoaderDialog(context).dispose();
    super.dispose();
  }

  void _printLatestUsername() {
    setState(
      () {
        loggedEmail = emailController.text;
      },
    );

    if (kDebugMode) {
      print(loggedEmail);
    }
  }

  void _printLatestPassword() {
    setState(
      () {
        password = passwordController.text;
      },
    );

    if (kDebugMode) {
      print(password);
    }
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
              TextfieldWidget(
                cntrl: emailController,
                onChanged: (value) {
                  setState(
                    () {
                      loggedEmail = value;
                    },
                  );
                },
                hintlines: "enter your email",
                prefixIcon: const Icon(Icons.account_circle_rounded),
              ),

              TextfieldWidget(
                onChanged: (value) {
                  setState(
                    () {
                      password = value;
                    },
                  );
                },
                cntrl: passwordController,
                hintlines: "password",
                prefixIcon: const Icon(Icons.lock_outline),
              ),
              const SizedBox(
                height: 23,
              ),
              FooterButton(
                  buttonName: "LOG IN",
                  pushToPage: () async {
                    if (loggedEmail == null || password == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Provide essential details"),
                        ),
                      );
                    } else {
                      showLoaderDialog(context);
                      Login? logData = await login(loggedEmail!, password!);
                      if (logData != null) {
                        Navigator.pop(context);
                        log(logData.token.toString());
                        setState(() {
                          token = logData.token;
                        });
                        setState(() {
                          email = loggedEmail;
                          profile = logData.profile;
                        });
                        if (logData.profile == "Worker") {
                          // ignore: use_build_context_synchronously
                          Navigator.of(context).pushReplacementNamed(
                              WorkerRoutes.WorkersRoutingPage);
                        } else {
                          // ignore: use_build_context_synchronously
                          Navigator.of(context).pushReplacementNamed(
                              ProviderRoutes.ProviderRoutingPage);
                        }
                      } else {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Incorrect Credentials."),
                          ),
                        );
                        // emailController.dispose();
                        // passwordController.dispose();
                      }
                    }
                  }

                  //   log(email.toString());
                  //   log(password.toString());
                  //   log(isSuccess.toString());
                  //   if (email == null || password == null) {
                  //     ScaffoldMessenger.of(context).showSnackBar(
                  //       const SnackBar(
                  //         content: Text(
                  //           "Provide Essential Details",
                  //         ),
                  //         duration: Duration(seconds: 1),
                  //       ),
                  //     );
                  //   } else {
                  //     showLoaderDialog(context);
                  //     await login(email!, password!).then((value) {
                  //       if (value != null) {
                  //         setState(() {
                  //           log("hii");
                  //           isSuccess = "true";
                  //         });
                  //       }
                  //     }).catchError((e) {
                  //       log(e.toString());
                  //     });
                  //     if (isSuccess == "false") {
                  //       Navigator.of(context, rootNavigator: true).pop();
                  //       ScaffoldMessenger.of(context).showSnackBar(
                  //         const SnackBar(
                  //           content: Text(
                  //             "Unauthorized Access",
                  //           ),
                  //           duration: Duration(seconds: 1),
                  //         ),
                  //       );
                  //     } else {
                  //       Navigator.pop(context);
                  //       Navigator.pushReplacementNamed(
                  //           context, Routes.LoadingScreen);
                  //     }
                  //   }
                  // }
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

class TextfieldWidget extends StatefulWidget {
  // controllers yet to be implemented.....
  const TextfieldWidget(
      {super.key,
      required this.hintlines,
      required this.prefixIcon,
      required this.cntrl,
      required this.onChanged});

  final String hintlines;
  final Icon prefixIcon;
  final TextEditingController cntrl;
  final Function(String) onChanged;

  @override
  State<TextfieldWidget> createState() => _TextfieldWidgetState();
}

class _TextfieldWidgetState extends State<TextfieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        onChanged: widget.onChanged,
        decoration: InputDecoration(
            prefixIcon: widget.prefixIcon,
            hintStyle: GoogleFonts.inter(color: Color(0xff565656)),
            hintText: widget.hintlines,
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.5)),
            enabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.5))),
      ),
    );
  }
}
