import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/constants.dart';

class WorkerMenuPage extends StatefulWidget {
  const WorkerMenuPage({Key? key}) : super(key: key);

  @override
  State<WorkerMenuPage> createState() => _WorkerMenuPageState();
}

class _WorkerMenuPageState extends State<WorkerMenuPage> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          const WorkerProfileMenu(
              firstName: "Aadarsh",
              lastName: "Pandey",
              profileImageLink: "https://brlakgec.com/assets/Aadarsh.jpeg"),
          const WorkerMenuCard(
            menuImageLink: ImageLink.profileUpdate,
            menuTitle: "Profile Update",
          ),
          const WorkerMenuCard(
              menuImageLink: ImageLink.chooseLanguage,
              menuTitle: "Choose Language"),
          const WorkerMenuCard(
              menuImageLink: ImageLink.history, menuTitle: "History"),
          const WorkerMenuCard(
              menuImageLink: ImageLink.helpCenter, menuTitle: "Help Center"),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.14,
          ),
          LogoutButton(
            logoutFunction: (){
              log("Worker Logout Presses");
            },
          ),
        ],
      ),
    );
  }
}

class WorkerMenuCard extends StatefulWidget {
  const WorkerMenuCard(
      {Key? key, required this.menuImageLink, required this.menuTitle})
      : super(key: key);

  final String? menuImageLink;
  final String? menuTitle;

  @override
  State<WorkerMenuCard> createState() => _WorkerMenuCardState();
}

class _WorkerMenuCardState extends State<WorkerMenuCard> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
      child: SizedBox(
        width: 328 * fem,
        height: 70 * fem,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15 * fem),
            color: const Color(0xffffffff),
            boxShadow: [
              BoxShadow(
                color: const Color(0x3f000000),
                offset: Offset(0 * fem, 4 * fem),
                blurRadius: 9 * fem,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  child: Image.asset(
                    widget.menuImageLink!,
                    scale: 2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Text(
                    widget.menuTitle!,
                    style: GoogleFonts.inter(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WorkerProfileMenu extends StatefulWidget {
  const WorkerProfileMenu(
      {Key? key,
      required this.firstName,
      required this.lastName,
      required this.profileImageLink})
      : super(key: key);

  final String? firstName;
  final String? lastName;
  final String? profileImageLink;

  @override
  State<WorkerProfileMenu> createState() => _WorkerProfileMenuState();
}

class _WorkerProfileMenuState extends State<WorkerProfileMenu> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
      child: SizedBox(
        width: 328 * fem,
        height: 110 * fem,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15 * fem),
            color: const Color(0xffffffff),
            boxShadow: [
              BoxShadow(
                color: const Color(0x3f000000),
                offset: Offset(0 * fem, 4 * fem),
                blurRadius: 9 * fem,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(widget.profileImageLink!),
                    minRadius: fem * 40,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.firstName!,
                        style: GoogleFonts.inter(
                            fontSize: 25.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      Text(
                        widget.lastName!,
                        style: GoogleFonts.inter(
                            fontSize: 25.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LogoutButton extends StatefulWidget {
  const LogoutButton({Key? key, required this.logoutFunction})
      : super(key: key);

  final VoidCallback? logoutFunction;

  @override
  State<LogoutButton> createState() => _LogoutButtonState();
}

class _LogoutButtonState extends State<LogoutButton> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: SizedBox(
        height: 50 * fem,
        child: ElevatedButton(
          onPressed: widget.logoutFunction,
          style: ElevatedButton.styleFrom(
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 30.0),
            elevation: 10.0,
            foregroundColor: Colors.white,
            backgroundColor: Colors.red,
            shadowColor: Colors.redAccent,
            side: const BorderSide(color: Colors.redAccent),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            "Log Out",
            style:
                GoogleFonts.inter(fontSize: 25.0, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
