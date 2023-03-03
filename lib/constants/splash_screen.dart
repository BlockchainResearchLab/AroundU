import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../Routes/routes.dart';
import 'constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController _controller;
  late Function _onVideoCompleted;


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
                const Duration(milliseconds: 4250),
                    () => Navigator.pushReplacementNamed(
                  context,
                  Routes.OnBoardingScreen
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
      backgroundColor: AppTheme.primaryColor,
      body: Center(
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
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

}
