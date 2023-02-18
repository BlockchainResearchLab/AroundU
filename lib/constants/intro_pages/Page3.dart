import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';
class PageThree extends StatelessWidget {
  const PageThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          ImageLink.mLogo,
          scale: 1.8,
        ),
        const SizedBox(
          height: 20.0,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          width: double.infinity,
          child: const Placeholder(),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Expanded(
          child: Text(
            "Personalised to the way you work",
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              textStyle: const TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.w700,
                color: Color(0xff565656),
              ),
            ),
          ),
        ),
        Expanded(
          child: Text(
            "Customize ClickUp to work\nfor you. No opinions,\njust options",
            style: GoogleFonts.inter(
              textStyle: const TextStyle(
                fontSize: 26.0,
                fontWeight: FontWeight.w600,
                color: Color(0xff565656),
              ),
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 50.0,
        ),
      ],
    );
  }
}
