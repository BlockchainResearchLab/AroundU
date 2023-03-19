import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/constants.dart';

final List localeLanguages = [
  {'name': 'ENGLISH', 'locale': Locale('en', 'US')},
  {'name': 'हिंदी', 'locale': Locale('hi', 'IN')},
  {'name': 'ગુજરાતી', 'lacale': Locale('guj', 'IN')},
];

class ProviderMenuPage extends StatefulWidget {
  const ProviderMenuPage({Key? key}) : super(key: key);

  @override
  State<ProviderMenuPage> createState() => _ProviderMenuPageState();
}

class _ProviderMenuPageState extends State<ProviderMenuPage> {
  buildDialog(BuildContext cntx) {
    showDialog(
      context: context,
      builder: (buider) {
        return AlertDialog(
          title: Text("Choose your language",
              style: GoogleFonts.inter(fontWeight: FontWeight.w600)),
          content: Container(
            width: double.maxFinite,
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (cntx, index) {
                return Text(localeLanguages[index]['name']);
              },
              separatorBuilder: (cntx, index) {
                return Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                );
              },
              itemCount: 3, //english, rajasthani, hindi
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          const ProviderProfileMenu(
              firstName: "Aadarsh",
              lastName: "Pandey",
              profileImageLink: "https://brlakgec.com/assets/Aadarsh.jpeg"),
          const ProviderMenuCard(
            menuImageLink: ImageLink.profileUpdate,
            menuTitle: "Profile Update",
          ),
          InkWell(
            onTap: () => buildDialog(context),
            child: const ProviderMenuCard(
                menuImageLink: ImageLink.chooseLanguage,
                menuTitle: "Choose Language"),
          ),
          const ProviderMenuCard(
              menuImageLink: ImageLink.history, menuTitle: "History"),
          const ProviderMenuCard(
              menuImageLink: ImageLink.helpCenter, menuTitle: "Help Center"),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.14,
          ),
          LogoutButton(
            logoutFunction: () {
              log("Provider Logout Pressed");
            },
          ),
        ],
      ),
    );
  }
}

class ProviderMenuCard extends StatefulWidget {
  const ProviderMenuCard(
      {Key? key, required this.menuImageLink, required this.menuTitle})
      : super(key: key);

  final String? menuImageLink;
  final String? menuTitle;

  @override
  State<ProviderMenuCard> createState() => _ProviderMenuCardState();
}

class _ProviderMenuCardState extends State<ProviderMenuCard> {
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

class ProviderProfileMenu extends StatefulWidget {
  const ProviderProfileMenu(
      {Key? key,
      required this.firstName,
      required this.lastName,
      required this.profileImageLink})
      : super(key: key);

  final String? firstName;
  final String? lastName;
  final String? profileImageLink;

  @override
  State<ProviderProfileMenu> createState() => _ProviderProfileMenuState();
}

class _ProviderProfileMenuState extends State<ProviderProfileMenu> {
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
