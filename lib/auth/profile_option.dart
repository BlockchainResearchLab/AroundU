import 'package:flutter/material.dart';
import 'package:tech_sprint_hackathon/constants/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileOption extends StatelessWidget {
  const ProfileOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 100.0, left: 35.0, right: 35.0, bottom: 100.0),
            child: Image.asset(ImageLink.mLogo),
          ),
          Column(
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  elevation: 10.0,
                  side: const BorderSide(color: Colors.black12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  shadowColor: AppTheme.shadowColor,
                  fixedSize: Size(250, 74 * fem),
                ),
                child: Text(
                  "Job Seeker",
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
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  elevation: 15.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  side: BorderSide(
                    color: AppTheme.shadowColor,
                  ),
                  backgroundColor: AppTheme.primaryColor,
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
          Image.asset(ImageLink.choosing),
        ],
      ),
    );
  }
}
