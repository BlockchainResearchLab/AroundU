import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
  static const String home = "assets/images/Home.png";
  static const String homeBlue = "assets/images/HomeBlue.png";
  static const String bookmark = "assets/images/Bookmark.png";
  static const String priceTag = "assets/images/PriceTag.png";
  static const String circle = "assets/images/AroundCircle.png";
  static const String plus = "assets/images/Plus.png";
  static const String providerEmptyScreen = "assets/images/ProviderEmptyScreen.png";
  static const String bookmarkHollow = "assets/images/BookmarkHollow.png";
  static const String chooseLanguage = "assets/images/ChooseLanguage.png";
  static const String helpCenter = "assets/images/HelpCenter.png";
  static const String history = "assets/images/History.png";
  static const String profileUpdate = "assets/images/ProfileUpdate.png";
  static const String comingSoon = "assets/images/ComingSoon.png";
}

class MapsConstants{
  static const String apiKey = "AIzaSyBmqqDVOlVdZLi1mY70I-jDiOn8XZAZXeI";
  static const LatLng sourceLocation = LatLng(28.676792506635017, 77.50076897100702);
  static const LatLng destination = LatLng(28.53908747355857, 77.25509413212828);
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
        margin: const EdgeInsets.only(top: 43),
        height: 36,
        width: 177,
        child: Image.asset(ImageLink.mLogo),
      ),
    );
  }
}

