import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';
class PageTwo extends StatelessWidget {
  const PageTwo({Key? key}) : super(key: key);

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
            child: Image.asset(ImageLink.pg2),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            "Save one day every\nweek, guarenteed",
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
            "Clickup users save one day\nevery week by putting\nwork in one place",
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
