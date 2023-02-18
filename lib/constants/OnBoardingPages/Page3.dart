import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';
class PageThree extends StatelessWidget {
  const PageThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            width: double.infinity,
            child: Image.asset(ImageLink.pg3),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            "Personalised to the way you work",
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              textStyle: const TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w700,
                color: Color(0xff565656),
              ),
            ),
          ),
          const SizedBox(height: 40.0,),
          Text(
            "Customize ClickUp to work\nfor you. No opinions,\njust options",
            style: GoogleFonts.inter(
              textStyle: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
                color: Color(0xff565656),
              ),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
