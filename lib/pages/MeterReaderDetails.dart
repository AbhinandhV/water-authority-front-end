import 'package:flutter/material.dart';

class MeterReaderDetails extends StatefulWidget {
  const MeterReaderDetails({super.key});

  @override
  State<MeterReaderDetails> createState() => _MeterReaderDetailsState();
}

class _MeterReaderDetailsState extends State<MeterReaderDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meter Reader"),
      ),
    );
  }
}
