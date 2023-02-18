import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tech_sprint_hackathon/constants/OnBoardingPages/on_boarding_page.dart';
import 'package:video_player/video_player.dart';

import '../Routes/routes.dart';
import 'constants.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController _controller;
  late Function _onVideoCompleted;

  // @override
  // void initState() {
  //   super.initState();
  //   _controller = VideoPlayerController.asset(ImageLink.splash);
  //   _onVideoCompleted = () {
  //     Navigator.of(context).pushReplacementNamed(Routes.OnBoardingScreen);
  //   };
  //   _controller.addListener(() {
  //     setState(() {});
  //     if (_controller.value.position == _controller.value.duration) {
  //       _onVideoCompleted();
  //     }
  //   });
  //
  //   _controller.initialize().then((_) {
  //     setState(() {
  //       _controller.play();
  //     });
  //   });
  //   _controller.play();
  // }


  // APPOORVA

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(ImageLink.splash)
      ..initialize().then(
            (_) {
          _controller.play();
          _controller.setLooping(false);
          setState(
                () {
              Timer(
                const Duration(milliseconds: 5000),
                    () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OnBoardingPage(),
                  ),
                ),
              );
            },
          );
        },
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Center(
          child: AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          ),

          // child: _controller.value.isInitialized        //false
          //     ? AspectRatio(
          //         aspectRatio: _controller.value.aspectRatio,
          //         child: VideoPlayer(_controller),
          //       )
          //     : Container(
          //         child: const LinearProgressIndicator(
          //           color: Colors.blue,
          //         ),
          //       ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

}
