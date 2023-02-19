import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:tech_sprint_hackathon/Routes/routes.dart';
import '../constants/constants.dart';

int _currentIndex = 0;

class WorkerRoutingPage extends StatefulWidget {
  const WorkerRoutingPage({Key? key}) : super(key: key);

  @override
  State<WorkerRoutingPage> createState() => _WorkerRoutingPageState();
}

class _WorkerRoutingPageState extends State<WorkerRoutingPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.green,  //TODO:CHANGES
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: SizedBox(width:150,child: Image.asset(ImageLink.mLogo),),
          ),
        ),
        body: WorkerRoutes.allWorkerPages.elementAt(_currentIndex),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.25),
              ),
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 8,
              ),
              child: GNav(
                textStyle: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
                haptic: true,
                tabBackgroundGradient: LinearGradient(
                  colors: [
                    AppTheme.primaryColor,
                    AppTheme.shadowColor,
                  ],
                ),
                tabBackgroundColor: AppTheme.primaryColor,
                rippleColor: AppTheme.shadowColor,
                // hoverColor: Colors.black38,
                gap: 10,
                activeColor: Colors.white,
                iconSize: 24,
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: const Duration(milliseconds: 300),
                color: AppTheme.primaryColor,
                tabs: const [
                  GButton(
                    backgroundColor: Colors.white,
                    icon: FontAwesomeIcons.houseUser,
                    iconSize: 25,
                    gap: 15,
                    text: 'Home',
                    textColor: Colors.white,
                    textSize: 40,
                  ),
                  GButton(
                    backgroundColor: Colors.white,
                    icon: FontAwesomeIcons.graduationCap,
                    iconSize: 25,
                    text: 'Skill',
                    gap: 15,
                    textColor: Colors.red,
                    textSize: 40,
                  ),
                  GButton(
                    backgroundColor: Colors.white,
                    icon: FontAwesomeIcons.barsStaggered,
                    iconSize: 25,
                    text: 'Menu',
                    gap: 15,
                    textColor: Colors.white,
                    textSize: 40,
                  ),
                ],
                selectedIndex: _currentIndex,
                onTabChange: (index) {
                  setState(
                        () {
                      _currentIndex = index;
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
