import 'dart:convert';
import 'dart:isolate';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:taskflow_application/API/login_user_detail.dart';
import 'package:taskflow_application/Api/api_info.dart';

class UserLogin {
  static Future<bool> userLogin(
      String email, String password, BuildContext context) async {
    bool authUser = false;
    try {
      //converting the licenceKey into the map format
      final loginMap = {"email": email, "password": password};

      final response =
          await post(Uri.parse("${Api.apiUrl}user/login"), body: loginMap);

      final userJson = jsonDecode(response.body);

      if (response.statusCode == 200) {
        debugPrint("API Body :${response.body}");
        authUser = true;
        //converting the the body into json format
        //here we are calling the UserDetail model to store the details of the user
        Provider.of<UserDetail>(context, listen: false).setUserDetail(userJson);

        //printing for testing purpose.
        print(
            "User Successfully login: ${Provider.of<UserDetail>(context, listen: false).token.toString()}");
      } else {
        print(response.body.toString());
      }
    } catch (error) {}
    return authUser;
  }
}
