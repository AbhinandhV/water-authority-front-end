import 'package:flutter/material.dart';

class MeterReaderFrontpage extends StatefulWidget {
  const MeterReaderFrontpage({super.key});

  @override
  State<MeterReaderFrontpage> createState() => _MeterReaderFrontpageState();
}

class _MeterReaderFrontpageState extends State<MeterReaderFrontpage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
      ),
    );
  }
}
