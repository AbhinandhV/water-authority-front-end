import 'package:flutter/material.dart';

class AdminUi extends StatefulWidget {
  const AdminUi({super.key});

  @override
  State<AdminUi> createState() => _AdminUiState();
}

class _AdminUiState extends State<AdminUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("ADMIN PAGE"),
      ),
    );
  }
}
