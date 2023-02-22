import 'package:flutter/cupertino.dart';
import 'package:tech_sprint_hackathon/service-providers/provider_menu_page.dart';
import 'package:tech_sprint_hackathon/workers/worker_menu.dart';
import 'package:tech_sprint_hackathon/workers/worker_skills.dart';
import 'package:tech_sprint_hackathon/workers/workers_feed.dart';

import '../service-providers/provider_job_page.dart';

class Routes {
  static String LoadingScreen = "/loading";
  static String OnBoardingScreen = "/onboarding";
  static String SplashScreen = "/splash";
  static String ProfileChoose = "/profile-choose";
  static String OTPScreen = "/otp";
  static String LoginScreen = "/login";
  static String RegistrationScreen = "/registration";
  static String ProviderHomePage = "/provider_home";
  static String WorkerHomePage = "/worker_home";
  static String Maps = "/maps";
}

class WorkerRoutes{
  static String WorkersRoutingPage = "/wrouting";
  static String WorkersProfilePage = "/wprofile";
  static String WorkerFeedPage = "/wfeed";
  static const List<Widget> allWorkerPages = [
    WorkersFeedPage(),
    WorkerSkillPage(),
    WorkerMenuPage(),
  ];
}

class ProviderRoutes{
  static String ProviderRoutingPage = "/prouting";
  static String ProviderProfilePage = "/pprofile";
  static String ProviderFeedPage = "/pfeed";
  static const List<Widget> allProviderPages = [
    ProviderJobPage(),
    ProviderMenuPage(),
  ];
}