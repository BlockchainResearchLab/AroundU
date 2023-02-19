import 'package:flutter/material.dart';

class WorkerSkillPage extends StatefulWidget {
  const WorkerSkillPage({Key? key}) : super(key: key);

  @override
  State<WorkerSkillPage> createState() => _WorkerSkillPageState();
}

class _WorkerSkillPageState extends State<WorkerSkillPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          "WORKER SKILL PAGE",
        ),
      ),
    );
  }
}
