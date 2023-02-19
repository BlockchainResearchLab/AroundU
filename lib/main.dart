import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tech_sprint_hackathon/auth/login.dart';
import 'package:tech_sprint_hackathon/auth/otp_screen.dart';
import 'package:tech_sprint_hackathon/auth/profile_option.dart';
import 'package:tech_sprint_hackathon/auth/registration.dart';
import 'package:tech_sprint_hackathon/constants/OnBoardingPages/on_boarding_page.dart';
import 'package:tech_sprint_hackathon/constants/loading_screen.dart';
import 'package:tech_sprint_hackathon/constants/splash_screen.dart';
import 'package:tech_sprint_hackathon/service-providers/provider_home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    const AroundU(),
  );
}

class AroundU extends StatelessWidget {
  const AroundU({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
        '/loading': (context) => const LoadingScreen(),
        '/onboarding': (context) => const OnBoardingPage(),
        '/profile-choose': (context) => const ProfileOption(),
        '/splash': (context) => SplashScreen(),
        '/otp': (context) => const OTPScreen(),
        '/login': (context) => const LoginScreen(),
        '/registration': (context) => const RegistrationPage(),
        '/provider_home': (context) => const ProviderHomePage(),
      },
    );
  }
}
