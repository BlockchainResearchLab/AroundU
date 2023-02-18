import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';
class PageTwo extends StatelessWidget {
  const PageTwo({Key? key}) : super(key: key);

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
            "Save one day every\nweek, guarenteed",
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
            "Clickup users save one day\nevery week by putting\nwork in one place",
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
