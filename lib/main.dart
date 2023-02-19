import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tech_sprint_hackathon/auth/login.dart';
import 'package:tech_sprint_hackathon/auth/otp_screen.dart';
import 'package:tech_sprint_hackathon/auth/profile_option.dart';
import 'package:tech_sprint_hackathon/auth/registration.dart';
import 'package:tech_sprint_hackathon/constants/OnBoardingPages/on_boarding_page.dart';
import 'package:tech_sprint_hackathon/constants/loading_screen.dart';
import 'package:tech_sprint_hackathon/constants/splash_screen.dart';
import 'package:tech_sprint_hackathon/service-providers/provider_profile_page.dart';
import 'package:tech_sprint_hackathon/service-providers/provider_routing_page.dart';
import 'package:tech_sprint_hackathon/workers/worker_profile_page.dart';
import 'package:tech_sprint_hackathon/workers/workers_routing_page.dart';

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
      initialRoute:
          '/pprofile', //TODO: CURRENTLY WORKING ON WORKER ROUTING PAGE
      routes: {
        '/loading': (context) => const LoadingScreen(),
        '/onboarding': (context) => const OnBoardingPage(),
        '/profile-choose': (context) => const ProfileOption(),
        '/splash': (context) => const SplashScreen(),
        '/otp': (context) => const OTPScreen(),
        '/login': (context) => const LoginScreen(),
        '/registration': (context) => const RegistrationPage(),
        '/pprofile': (context) => const ProviderProfilePage(),
        '/wprofile': (context) => const WorkerProfilePage(),
        '/wrouting': (context) => const WorkerRoutingPage(),
        '/prouting': (context) => const ProvidersRoutingPage(),
      },
    );
  }
}
