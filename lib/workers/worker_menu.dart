import 'package:flutter/material.dart';

class WorkerMenuPage extends StatefulWidget {
  const WorkerMenuPage({Key? key}) : super(key: key);

  @override
  State<WorkerMenuPage> createState() => _WorkerMenuPageState();
}

class _WorkerMenuPageState extends State<WorkerMenuPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          "WORKER MENU PAGE",
        ),
      ),
    );
  }
}
