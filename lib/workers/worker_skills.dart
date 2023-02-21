import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';

class WorkerSkillPage extends StatefulWidget {
  const WorkerSkillPage({Key? key}) : super(key: key);

  @override
  State<WorkerSkillPage> createState() => _WorkerSkillPageState();
}

class _WorkerSkillPageState extends State<WorkerSkillPage> {
  @override
  Widget build(BuildContext context) {
    return CustomRefreshIndicator(
      onRefresh: () {
        return Future.delayed(const Duration(seconds: 2), () {
          setState(() {});
        });
      },
      builder: MaterialIndicatorDelegate(
        backgroundColor: AppTheme.primaryColor,
        builder: (context, controller) {
          return Image.asset(
            ImageLink.circle,
            scale: 7,
          );
        },
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.30,
            ),
            Image.asset(
              ImageLink.comingSoon,
              scale: 1.5,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
          ],
        ),
      ),
    );
  }
}
