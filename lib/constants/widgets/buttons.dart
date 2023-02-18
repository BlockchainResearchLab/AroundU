import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../loading_screen.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Material(
      child: InkWell(
        splashColor: Colors.black,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LoadingScreen(),
            ),
          );
        },
        child: Container(
          // group2TAA (3:103)
          margin:  EdgeInsets.fromLTRB(14*fem, 0*fem, 15*fem, 0*fem),
          width:  double.infinity,
          height:  50*fem,
          decoration:  BoxDecoration (
            color:  const Color(0xff0476ff),
            borderRadius:  BorderRadius.circular(12*fem),
            boxShadow:  [
              BoxShadow(
                color:  const Color(0x3f0476ff),
                offset:  Offset(0*fem, 4*fem),
                blurRadius:  6.5*fem,
              ),
            ],
          ),
          child:
          Center(
            child:
            Text(
              'Get Started',
              textAlign:  TextAlign.center,
              style:  GoogleFonts.inter(
                // 'Inter',
                fontSize:  18*ffem,
                fontWeight:  FontWeight.w600,
                height:  1.2125*ffem/fem,
                color:  const Color(0xffffffff),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
