import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tech_sprint_hackathon/constants/constants.dart';
import 'package:tech_sprint_hackathon/constants/widgets/buttons.dart';
import 'Page1.dart';
import 'Page2.dart';
import 'Page3.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final controller = PageController(viewportFraction: 0.8, keepPage: false);
  final pages = <Widget>[
    const PageOne(),
    const PageTwo(),
    const PageThree(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.82,
                child: PageView.builder(
                  controller: controller,
                  // itemCount: pages.length,
                  itemBuilder: (_, index) {
                    return pages[index % pages.length];
                  },
                ),
              ),

              // WORM EFFECT

              const SizedBox(
                height: 10.0,
              ),
              SmoothPageIndicator(
                controller: controller,
                count: pages.length,
                effect: WormEffect(
                  spacing: 20,
                  radius: 16,
                  activeDotColor: AppTheme.primaryColor,
                  dotHeight: 10,
                  dotWidth: 10,
                  type: WormType.thin,
                  // strokeWidth: 5,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const InkWell(
                splashColor: Colors.black,
                child: GetStartedButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// FOR SLIDING OPTIONS

// JUMPING DOTS

// const Padding(
//   padding: EdgeInsets.only(top: 16, bottom: 8),
//   child: Text(
//     'Jumping Dot',
//     style: TextStyle(color: Colors.black54),
//   ),
// ),
// SmoothPageIndicator(
//   controller: controller,
//   count: pages.length,
//   effect: const JumpingDotEffect(
//     dotHeight: 16,
//     dotWidth: 16,
//     jumpScale: .7,
//     verticalOffset: 15,
//   ),
// ),

// SCROLLING DOTS

// const Padding(
//   padding: EdgeInsets.only(top: 16, bottom: 12),
//   child: Text(
//     'Scrolling Dots',
//     style: TextStyle(color: Colors.black54),
//   ),
// ),
// SmoothPageIndicator(
//   controller: controller,
//   count: pages.length,
//   effect: const ScrollingDotsEffect(
//     activeStrokeWidth: 2.6,
//     activeDotScale: 1.3,
//     maxVisibleDots: 5,
//     radius: 8,
//     spacing: 10,
//     dotHeight: 12,
//     dotWidth: 12,
//   ),
// ),
