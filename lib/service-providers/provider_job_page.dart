import 'package:flutter/material.dart';

class ProviderJobPage extends StatefulWidget {
  const ProviderJobPage({Key? key}) : super(key: key);

  @override
  State<ProviderJobPage> createState() => _ProviderJobPageState();
}

class _ProviderJobPageState extends State<ProviderJobPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          "PROVIDER JOB PAGE",
        ),
      ),
    );
  }
}
