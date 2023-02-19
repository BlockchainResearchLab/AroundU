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
          backgroundColor: AppTheme.primaryColor,
          title: Text(
            "Around U",
            style: GoogleFonts.inter(),
          ),
        ),
        body: WorkerRoutes.allWorkerPages.elementAt(_currentIndex),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: AppTheme.primaryColor,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.2),
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
                textStyle: GoogleFonts.orbitron(),
                haptic: true,
                // tabBackgroundGradient: const LinearGradient(
                //   colors: [
                //     AppTheme.highlightColor,
                //     AppTheme.highlightColor2,
                //   ],
                // ),
                // rippleColor: AppTheme.highlightColor,
                // hoverColor: AppTheme.secondaryColor,
                gap: 10,
                activeColor: AppTheme.primaryColor,
                iconSize: 24,
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: const Duration(milliseconds: 300),
                // tabBackgroundColor: AppTheme.secondaryColor,
                // color: AppTheme.highlightColor2,
                tabs: const [
                  GButton(
                    icon: FontAwesomeIcons.house,
                    text: 'Home',
                  ),
                  GButton(
                    icon: Icons.shopping_cart,
                    text: 'SKill',
                  ),
                  GButton(
                    icon: FontAwesomeIcons.heart,
                    text: 'Menu',
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
