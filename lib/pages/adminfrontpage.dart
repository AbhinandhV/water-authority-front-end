import 'package:flutter/material.dart';
import 'package:waterauthority/pages/MeterReaderDetails.dart';
import 'package:waterauthority/pages/adminUi.dart';
import 'package:waterauthority/pages/consumerdetails.dart';
import 'package:waterauthority/pages/subadminadd.dart';

class AdminFrontPage extends StatefulWidget {
  const AdminFrontPage({Key? key}) : super(key: key);

  @override
  State<AdminFrontPage> createState() => _AdminFrontPageState();
}

class _AdminFrontPageState extends State<AdminFrontPage> {
  final List<Widget> pages = [
    AdminUi(),
    Subadminadd(),
    MeterReaderDetails(),
    ConsumerDetails()
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          showSelectedLabels: true,
          showUnselectedLabels:true,
          selectedLabelStyle: TextStyle(color: Colors.blue),
          unselectedLabelStyle: TextStyle(color: Colors.black),
        ),
      ),
      home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              leading: SizedBox(
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                ),
              ),
            ),
            body: pages[currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                print(index);
                setState(() {
                  currentIndex = index;
                });
              },
              items: [
                BottomNavigationBarItem(

                  tooltip: "SUB_ADMIN",
                  icon: Icon(Icons.home),
                  label: "HOME",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.supervised_user_circle_outlined),
                  label: "SUB_ADMIN",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_pin_circle_sharp),
                  label: "Meter reader"
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: "CONSUMER",
                ),
              ],
            ),
      ),
    );

  }
}


