import 'package:flutter/material.dart';
import 'package:waterauthority/pages/view_subadmin.dart';
import 'package:waterauthority/services/userService.dart';

class Subadminadd extends StatefulWidget {
  const Subadminadd({Key? key}) : super(key: key);

  @override
  State<Subadminadd> createState() => _SubadminaddState();
}

class _SubadminaddState extends State<Subadminadd> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isUsernameExists = false;
  TextEditingController n1 = TextEditingController();
  TextEditingController n2 = TextEditingController();
  TextEditingController n3 = TextEditingController();
  TextEditingController n4 = TextEditingController();
  TextEditingController n5 = TextEditingController();
  TextEditingController n6 = TextEditingController();

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a phone number';
    }
    if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  void submit() async {
    if (_formKey.currentState!.validate()) {
      final response = await userLoginApi().addSubAdmin(
        n1.text,    // subadmin_name
        n3.text,    // subadmin_place
        n2.text,    // subadmin_phone
        n4.text,    // subadmin_email
        n5.text,    // username
        n6.text,    // password
      );
      if (response["status"] == "success") {
        print("successfully added");
        showSimplePopup1(context, "SUB ADMIN ADDED");
        _formKey.currentState!.reset();
      } else {
        print("error");
      }
    }
  }
  void addSubAdmin(String Username) async {
    try {
      final usernameExists = await userLoginApi().checkUsernameExists(Username);
      if (usernameExists) {
        showSimplePopup1(context, "Username already exists");
        // Disable the submit button
        setState(() {
          _isUsernameExists = true;
        });
        return;
      }
      // If the username doesn't exist, enable the submit button
      setState(() {
        _isUsernameExists = false;
      });
    } catch (error) {
      print("Error adding subadmin: $error");
      showSimplePopup1(context, "Failed to add subadmin");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SUB ADMIN DETAILS"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Text(
                'MENU',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('VIEW SUBADMIN'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewSubAdmin()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(40),
            color: Colors.black38,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: n1,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "NAME",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    controller: n2,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "PLACE",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a place';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    controller: n3,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "PHONE NUMBER",
                    ),
                    validator: validatePhoneNumber,
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    controller: n4,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "EMAIL",
                    ),
                    validator: validateEmail,
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    controller: n5,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "USERNAME",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a username';
                      }

                      return null;
                    },
                    onChanged: addSubAdmin,
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    controller: n6,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "PASSWORD",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: _isUsernameExists ? null : submit,
                    child: Text("SUBMIT"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showSimplePopup1(BuildContext context, String s) {
    final snackBar = SnackBar(
      content: Text(
        s,
        style: TextStyle(color: Colors.black),
      ),
      duration: Duration(seconds: 5),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.white,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
