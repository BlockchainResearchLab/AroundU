import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tech_sprint_hackathon/constants/constants.dart';
import 'package:tech_sprint_hackathon/constants/widgets/buttons.dart';
import 'Page1.dart';
import 'Page2.dart';
import 'Page3.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final controller = PageController(viewportFraction: 1.1, keepPage: false);
  final pages = <Widget>[
    const PageOne(),
    const PageTwo(),
    const PageThree(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50.0,
            ),
            Image.asset(
              ImageLink.mLogo,
              scale: 2.5,
            ),
            const SizedBox(
              height: 20.0,
            ),
            // const SizedBox(height: 16),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.72,
              child: PageView.builder(
                // pageSnapping: false,
                controller: controller,
                // dragStartBehavior: DragStartBehavior.down,
                // allowImplicitScrolling: false,
                // itemCount: pages.length,
                padEnds: true,
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
            const GetStartedButton(),
          ],
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
