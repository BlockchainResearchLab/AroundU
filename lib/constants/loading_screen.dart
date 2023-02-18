import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      // introBcn (2:3)
      padding: EdgeInsets.fromLTRB(77 * fem, 315 * fem, 77 * fem, 200 * fem),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xfff8f9fb),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            // vectorTKQ (3:5)
            margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 26 * fem),
            width: 200 * fem,
            height: 200 * fem,
            child: Image.asset(
              "assets/images/MainLogo.png",
              width: 200 * fem,
              height: 200 * fem,
            ),
          ),
          const LinearProgressIndicator(
            color: Color(0xff0476ff),
          ),
          // Text(
          //   // projectnamehjY (3:6)
          //   'Around U',
          //   style:  GoogleFonts.jura(
          //     // 'Jura',
          //     fontSize:  30*ffem,
          //     fontWeight:  FontWeight.w700,
          //     height:  1.1825*ffem/fem,
          //     color:  const Color(0xff0476ff),
          //   ),
          // ),
        ],
      ),
    );
  }
}
