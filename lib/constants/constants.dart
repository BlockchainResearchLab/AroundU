import 'package:flutter/material.dart';

class ImageLink {
  static const String mLogo = "assets/images/MainLogo.png";
  static const String mLogoWhite = "assets/images/MainLogoWhite.png";
  static const String pg1 = "assets/images/Page1.png";
  static const String pg2 = "assets/images/Page2.png";
  static const String pg3 = "assets/images/Page3.png";
  static const String otp = "assets/images/OTP.png";
  static const String reg = "assets/images/RegistrationPage.png";
  static const String login = "assets/images/LoginPage.png";
  static const String choosing = "assets/images/ChoosingImage.png";
  static const String splash = "assets/videos/splash.mp4";
}

class AppTheme {
  static Color primaryColor = const Color(0xff0476ff);
  static Color shadowColor = const Color(0x3f0476ff);
}

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 43),
        height: 36,
        width: 177,
        child: Image.asset(ImageLink.mLogo),
      ),
    );
  }
}
