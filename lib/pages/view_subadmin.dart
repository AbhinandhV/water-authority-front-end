import 'package:flutter/material.dart';
import 'package:waterauthority/models/subadmin.dart';
import 'package:waterauthority/services/userService.dart';

class ViewSubAdmin extends StatefulWidget {
  const ViewSubAdmin({Key? key}) : super(key: key);

  @override
  State<ViewSubAdmin> createState() => _ViewSubAdminState();
}

class _ViewSubAdminState extends State<ViewSubAdmin> {
  Future<List<Subadmin>>? data;

  @override
  void initState() {
    super.initState();
    data = userLoginApi().ViewSubadmin();
  }

  void delete(String id) async {
    final response = await userLoginApi().deleteData(id);
    if (response["status"] == "success") {
      showSimplePopup1(context, "SUBADMIN DELETED");
      print("successfully deleted");
      setState(() {
        // Trigger a rebuild of the widget tree to reflect the changes
        data = userLoginApi().ViewSubadmin();
      });
    } else {
      print("error: ${response["message"]}");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Subadmin List'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/world-map-with-global-technology-or-social-connection-network-with-nodes-and-links-vector-illustration_1284-1968-min-626x381.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/world-map-with-global-technology-or-social-connection-network-with-nodes-and-links-vector-illustration_1284-1968-min-626x381.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Content overlay
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: FutureBuilder(
              future: data,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 16),
                        Text(
                          'Loading data...',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      'Error loading data',
                      style: TextStyle(color: Colors.red),
                    ),
                  );
                } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final subadmin = snapshot.data![index];
                      return Card(
                        color: Colors.transparent,
                        elevation: 4,
                        child: ListTile(
                          title: Text(subadmin.subadminName,style: TextStyle(color: Colors.white)),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 4),
                              Text('Phone Number: ${subadmin.subadminPhone}',style: TextStyle(color: Colors.white),),
                              SizedBox(height: 4),
                              Text('Place: ${subadmin.subadminPlace}',style: TextStyle(color: Colors.white)),
                              SizedBox(height: 4),
                              Text('Email: ${subadmin.subadminEmail}',style: TextStyle(color: Colors.white)),
                              SizedBox(height: 4),
                              Text('Username: ${subadmin.username}',style: TextStyle(color: Colors.white)),
                            ],
                          ),
                          trailing: IconButton(
                              color: Colors.white,
                              icon: Icon(Icons.delete),
                              onPressed:(){
                                delete(subadmin.id);
                              }
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: Text(
                      'No data available',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
  void showSimplePopup1(BuildContext context, String s) {
    final snackBar = SnackBar(
      content: Text(s,style: TextStyle(color: Colors.black),),
      duration: Duration(seconds: 3),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.white70,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
