import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import '../shared/user.dart';
import 'dart:convert';

import '../url/engage_backend.dart';

class UserHelper {
  static const String SIGNUP_URL = ENGAGE_BACKEND_API_URL + 'signup/';
  static const String LOGIN_URL = ENGAGE_BACKEND_API_URL + 'login/';

  static Future<User> createUser(String username, String email, String password) async {
    var response = await http.post( SIGNUP_URL, body: {"name": username, "email" : email, "password" : password});
    if (response.statusCode == 201 ){
      var token = json.decode(response.body);
      return new User(username, username, token["token"]);
    } else {
      print("***** Error signup response code: " + response.statusCode.toString() + "******");
      return null;
    }
  }

  static Future<User> loginUser(String email, String password) async {
    var response = await http.post( LOGIN_URL, body: {"email" : email, "password" : password});
    if(response.statusCode == 201){
      var token = json.decode(response.body);
      return new User("", email, token["token"]);
    } else {
      print("***** Error login response code: " + response.statusCode.toString() + "******");
      return null;
    }
    //password.
  }

}