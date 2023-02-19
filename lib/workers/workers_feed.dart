import 'package:flutter/material.dart';

class WorkersFeedPage extends StatefulWidget {
  const WorkersFeedPage({Key? key}) : super(key: key);

  @override
  State<WorkersFeedPage> createState() => _WorkersFeedPageState();
}

class _WorkersFeedPageState extends State<WorkersFeedPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          "WORKER FEED PAGE",
        ),
      ),
    );
  }
}
