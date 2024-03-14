import "dart:convert";

import "package:http/http.dart" as http;
import "package:waterauthority/models/subadmin.dart";

class userLoginApi{

  Future<dynamic>loginUser(String username,String password)async{
    var client=http.Client();
    var apiUrl=Uri.parse("http://localhost:3000/waterauthority/login");
    var response=await client.post(apiUrl,
    headers: <String,String>{
      "Content-Type": "application/json; charset=UTF-8"
    },
      body: jsonEncode(<String,String>{
        "username":username,
        "password":password
      })
    );
    if(response.statusCode==200)
      {
        return json.decode(response.body);
      }
    else
      {
        throw Exception("Failed to login");
      }

  }
Future<dynamic> addSubAdmin(
    String name,String phonenumber,String place,String email,String username,
    String password
    )async
{
  var client=http.Client();
  var apiurl=Uri.parse("http://localhost:3000/waterauthority/addsubadmin");
  var response=await client.post(apiurl,
  headers: <String,String>
  {
    "Content-Type":"application/json; charset=UTF-8"
  },
  body:jsonEncode(<String,String>
  {
    "subadmin_name":name,
    "subadmin_place":place,
    "subadmin_phone":phonenumber,
    "subadmin_email":email,
    "username":username,
    "password":password
  }
  )
  );
  if(response.statusCode==200)
    {
      return json.decode(response.body);
    }
  else
    {
      throw Exception("failed to submit data");
    }
}
Future<List<Subadmin>> ViewSubadmin()async{
    var client=http.Client();
    var apiurl=Uri.parse("http://localhost:3000/waterauthority/viewsubadmin");
    var response=await client.post(apiurl);
    if(response.statusCode==200)
      {
        return subadminFromJson(response.body);
      }
    else
      {
        return [];

      }
}
  Future<dynamic> deleteData(String id) async {
    var client = http.Client();
    var apiUrl = Uri.parse("http://localhost:3000/waterauthority/deletemember");
    var response = await client.post(apiUrl,
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8"
        },
        body: jsonEncode(<String, String>{
          "_id": id
        })
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    else {
      throw Exception("Failed");
    }
  }
  Future<bool> checkUsernameExists(String username) async {
    try {
      var client = http.Client();
      var apiurl = Uri.parse("http://localhost:3000/waterauthority//checkUsernam");
      var response = await client.post(
        apiurl,
        body: jsonEncode({"username": username}),
        headers: {"Content-Type": "application/json"},
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['exists'];
      } else {
        throw Exception('Failed to check username existence');
      }
    } catch (error) {
      print("Error checking username: $error");
      return true; // Assume username exists in case of error
    }
  }

}