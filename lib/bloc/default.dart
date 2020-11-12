import 'package:alpha_drivers/bloc/location/index.dart';
import 'package:alpha_drivers/model/history.dart';
import 'package:flutter/material.dart';

class MainBloc with ChangeNotifier, LocationBloc {
  String earnings = '0';
  int tripCount = 0;
  List<History> tripHistory = [];
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
  void updateTripHistory(History historyItem){
    tripHistory.add(historyItem);
    notifyListeners();
  }
}
