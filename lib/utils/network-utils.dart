import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NetworkUtils{
  static showRedToast(String message) {
    FlutterToast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 4,
        backgroundColor: Color(0xFFCB4250),
        textColor: Color(0xFFFFFFFF),
        fontSize: 16.0);
  }
  static showToast(String message) {
    FlutterToast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 4,
        backgroundColor: Color(0xFFFFDA05),
        textColor:  Color(0xFF226ADB),
        fontSize: 16.0);
  }
  static showToastCenter(String message) {
    FlutterToast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 4,
        backgroundColor: Color(0xFFFFFFFF),
        textColor:  Color(0xFF226ADB),
        fontSize: 16.0);
  }
  static showSnackBar(GlobalKey<ScaffoldState> scaffoldKey, String message) {
    scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(message ?? 'No internet Connection'),
    ));
  }
}