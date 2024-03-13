import 'package:flutter/material.dart';

class ConsumerDetails extends StatefulWidget {
  const ConsumerDetails({super.key});

  @override
  State<ConsumerDetails> createState() => _ConsumerDetailsState();
}

class _ConsumerDetailsState extends State<ConsumerDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("consumer"),
      ),
    );
  }
}
