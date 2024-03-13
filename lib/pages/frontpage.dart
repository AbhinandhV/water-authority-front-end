import 'package:flutter/material.dart';
import 'package:waterauthority/pages/MeterReaderFrontpage.dart';
import 'package:waterauthority/pages/adminfrontpage.dart';
import 'package:waterauthority/pages/consumerFrontPage.dart';
import 'package:waterauthority/pages/subadminFrontpage.dart';
import 'package:waterauthority/services/userService.dart';

class FrontPage extends StatefulWidget {
  const FrontPage({Key? key}) : super(key: key);

  @override
  State<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  String username = "";
  String password = "";
  TextEditingController n1 = TextEditingController();
  TextEditingController n2 = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // Initialize text controllers and add listener for changes
    n1.addListener(() {
      setState(() {
        username = n1.text;
      });
    });
    n2.addListener(() {
      setState(() {
        password = n2.text;
      });
    });
  }

  Future<void> login() async {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      final response = await userLoginApi().loginUser(username, password);
      if (response["status"] == "admin login success") {
        showSimplePopup1(context, "admin login success");
        Navigator.push(context, MaterialPageRoute(builder: (context) => AdminFrontPage()));
      } else if (response["status"] == "login subadmin successfull") {
        Navigator.push(context, MaterialPageRoute(builder: (context) => subadminFrontpage()));
        showSimplePopup1(context, "subadmin login success");

      } else if (response["status"] == "user login success") {
        Navigator.push(context, MaterialPageRoute(builder: (context) => consumerFrontpage()));
        showSimplePopup1(context, "user login success");

      } else if (response["status"] == "meterReader login success") {
        Navigator.push(context, MaterialPageRoute(builder: (context) => MeterReaderFrontpage()));
        showSimplePopup1(context, "meter Reader login success");
      }
      else
        {
          showSimplePopup1(context, "invalid user");
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: TextFormField(
                    controller: n1,
                    decoration: InputDecoration(
                      labelText: "Username",
                      hintText: "Enter username",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please enter username';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: n2,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Enter password",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30),
                ElevatedButton(onPressed: login, child: Text("LOGIN")),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void showSimplePopup1(BuildContext context, String s)
  {
    final snackBar= SnackBar(
        content:Text(s,style: TextStyle(color: Colors.black),),
      duration:Duration(seconds:3),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.white,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

