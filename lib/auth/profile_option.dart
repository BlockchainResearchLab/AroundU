import 'package:flutter/material.dart';
import 'package:tech_sprint_hackathon/constants/constants.dart';

class ProfileOption extends StatelessWidget {
  const ProfileOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(ImageLink.mLogo),
            Container(

            ),
            Image.asset(ImageLink.choosing),
          ],
        ),
      ),
    );
  }
}
