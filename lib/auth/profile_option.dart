import 'package:flutter/material.dart';
import 'package:tech_sprint_hackathon/Routes/routes.dart';
import 'package:tech_sprint_hackathon/auth/registration.dart';
import 'package:tech_sprint_hackathon/constants/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_sprint_hackathon/models/registration_model.dart';
import 'package:tech_sprint_hackathon/services/auth-api-service/registration_api.dart';

import '../service-providers/provider_profile_page.dart';
import '../service-providers/provider_profile_page.dart';
import '../workers/worker_profile_page.dart';

int? mutex; // 0 == JOB PROVIDER && 1 == JOB SEEKER
int clicked = 0;
String? profile;

class ProfileOption extends StatefulWidget {
  const ProfileOption({Key? key}) : super(key: key);

  @override
  State<ProfileOption> createState() => _ProfileOptionState();
}

class _ProfileOptionState extends State<ProfileOption> {
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
    // TODO: implement initState
    setState(() {
      mutex == 0 ? profile = "Provider" : profile = "Worker";
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    print("Mutex = $mutex & ClickCount = $clicked");
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 60.0, left: 35.0, right: 35.0, bottom: 100.0),
            child: Image.asset(ImageLink.mLogo),
          ),
          Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  // Navigator.pushNamed(context, Routes.LoadingScreen);
                  setState(() {
                    clicked = clicked + 1; // For counting the clicks
                    mutex = 1;
                    print("Mutex = $mutex & ClickCount = $clicked");
                  });
                },
                style: ElevatedButton.styleFrom(
                  elevation: 10.0,
                  side: BorderSide(color: AppTheme.shadowColor),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  backgroundColor: mutex == null
                      ? Colors.white
                      : (mutex == 0
                          ? Colors.white
                          : AppTheme
                              .primaryColor), // 0 == JOB PROVIDER && 1 == JOB SEEKER
                  foregroundColor: mutex == null
                      ? Colors.black
                      : (mutex == 0 ? Colors.black : Colors.white),
                  shadowColor: AppTheme.shadowColor,
                  fixedSize: Size(250, 74 * fem),
                ),
                child: Text(
                  "Job Worker",
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                        fontSize: 23 * ffem, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              const SizedBox(
                height: 25.0,
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigator.pushNamed(context, Routes.LoadingScreen);
                  setState(() {
                    clicked = clicked + 1; // For counting the clicks
                    mutex = 0;
                    print("Mutex = $mutex & ClickCount = $clicked");
                  });
                },
                style: ElevatedButton.styleFrom(
                  elevation: 15.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  side: BorderSide(
                    color: AppTheme.shadowColor,
                  ),
                  backgroundColor: mutex == null
                      ? Colors.white
                      : (mutex == 0
                          ? AppTheme.primaryColor
                          : Colors
                              .white), // 0 == JOB PROVIDER && 1 == JOB SEEKER
                  foregroundColor: mutex == null
                      ? Colors.black
                      : (mutex == 0 ? Colors.white : Colors.black),
                  shadowColor: AppTheme.shadowColor,
                  fixedSize: Size(250, 74 * fem),
                ),
                child: Text(
                  "Job Provider",
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                        fontSize: 23 * ffem, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Visibility(
              visible: clicked == 0 ? false : true,
              child: ElevatedButton(
                // clipBehavior: Clip.hardEdge,
                onPressed: () async {
                  // mutex == 1
                  //     ? Navigator.pushNamed(
                  //         context, WorkerRoutes.WorkersProfilePage)
                  //     : Navigator.pushNamed(
                  //         context, ProviderRoutes.ProviderProfilePage);
                  showLoaderDialog(context);
                  Registered? dataFromBackend =
                      await register(email!, password!, phone!, profile!);
                  if (dataFromBackend!.status == 200) {
                    print(dataFromBackend.token);
                    if (mutex == 0) {
                      Navigator.pop(context);
                      Navigator.pushReplacementNamed(
                          context, Routes.LoadingScreen);
                    } else {
                      Navigator.pop(context);
                      Navigator.pushReplacementNamed(
                          context, Routes.LoadingScreen);
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(dataFromBackend.status.toString())));
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 30.0),
                  elevation: 10.0,
                  foregroundColor: Colors.white,
                  backgroundColor: AppTheme.primaryColor,
                  shadowColor: AppTheme.shadowColor,
                  side: const BorderSide(color: Colors.white),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                child: Text(
                  "Proceed",
                  style: GoogleFonts.inter(fontSize: 25.0),
                ),
              ),
            ),
          ),
          Image.asset(ImageLink.choosing),
        ],
      ),
    );
  }
}
