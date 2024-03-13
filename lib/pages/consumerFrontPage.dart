import 'package:flutter/material.dart';

class consumerFrontpage extends StatefulWidget {
  const consumerFrontpage({super.key});

  @override
  State<consumerFrontpage> createState() => _consumerFrontpageState();
}

class _consumerFrontpageState extends State<consumerFrontpage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
      ),
    );
  }
}
