import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_sprint_hackathon/constants/widgets/buttons.dart';

import '../constants.dart';

class PageOne extends StatelessWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
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
            "One place\nfor all your work",
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
            "Jobs, Docs, Goals, Chats\ncustomize your work\nfor everyone",
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
