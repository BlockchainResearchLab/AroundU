import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tech_sprint_hackathon/constants/intro_pages/intro_page.dart';
import 'package:tech_sprint_hackathon/constants/loading_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const AroundU());
}

class AroundU extends StatelessWidget {
  const AroundU({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/intro',
      routes: {
        '/loading': (context) => const LoadingScreen(),
        '/intro': (context) => const IntroPage(),
      },
    );
  }
}
