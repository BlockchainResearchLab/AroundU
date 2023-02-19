import 'package:flutter/material.dart';

class ProviderMenuPage extends StatefulWidget {
  const ProviderMenuPage({Key? key}) : super(key: key);

  @override
  State<ProviderMenuPage> createState() => _ProviderMenuPageState();
}

class _ProviderMenuPageState extends State<ProviderMenuPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          "PROVIDER MENU PAGE",
        ),
      ),
    );
  }
}
