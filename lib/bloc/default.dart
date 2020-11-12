import 'package:alpha_drivers/bloc/location/index.dart';
import 'package:flutter/material.dart';

class MainBloc with ChangeNotifier, LocationBloc {
  String earnings = '0';
  int tripCount = 0;
  List<String> tripHistoryKeys = [];

  void updateEarnings(String newEarnings){
    earnings = newEarnings;
    notifyListeners();
  }

  void updateTripCount(int newTripCount){
    tripCount = newTripCount;
    notifyListeners();
  }

  void updateTripKeys(List<String> newKeys){
    tripHistoryKeys = newKeys;
    notifyListeners();
  }

}
