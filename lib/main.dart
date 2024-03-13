import 'package:flutter/material.dart';
import 'package:waterauthority/pages/frontpage.dart';
void main()
{
  runApp(ui());
}
class ui extends StatelessWidget {
  const ui({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(builder: (context)=>FrontPage()),
    );
  }
}
