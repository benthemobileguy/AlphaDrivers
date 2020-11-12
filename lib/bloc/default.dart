import 'package:alpha_drivers/bloc/location/index.dart';
import 'package:flutter/material.dart';


class MainBloc with
    ChangeNotifier,
    LocationBloc{
  String _bearerToken;
  String earnings = '0';
  String get bearerToken {
    return _bearerToken;
  }

  set bearerToken(token) {
    _bearerToken = token;
  }
void updateEarnings(String newEarnings){
   earnings = newEarnings;
   notifyListeners();
}
}