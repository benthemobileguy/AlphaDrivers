import 'package:alpha_drivers/model/location.dart';
import 'package:flutter/material.dart';

class LocationBloc extends ChangeNotifier {
Location _location;
  Location get userLocation {
    return _location;
  }

  set userLocation(Location _data) {
    this._location = _data;
    notifyListeners();
  }

}