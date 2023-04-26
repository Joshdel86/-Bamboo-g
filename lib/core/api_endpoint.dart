import 'package:flutter/material.dart';

const String Base_URL = '';

class ApiEndpoints {
  static String registerUser() {
    return 'https://bamboog.herokuapp.com/ap1/v1/user/signup';
  }

  static String logInUser() {
    return 'https://bamboog.herokuapp.com/ap1/v1/user/login';
  }
  static String getconf() {
    return 'https://bamboog.herokuapp.com/ap1/v1/user/allproduct/Confectionery';
  }
  static String getdrink() {
    return 'https://bamboog.herokuapp.com/ap1/v1/user/allproduct/Drinks';
  }

  
}
