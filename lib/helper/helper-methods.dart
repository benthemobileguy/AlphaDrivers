import 'package:alpha_drivers/bloc/default.dart';
import 'package:alpha_drivers/datamodels/direction-details.dart';
import 'package:alpha_drivers/helper/request-helper.dart';
import 'package:alpha_drivers/model/user.dart';
import 'package:alpha_drivers/screens/components/progress-dialog.dart';
import 'package:alpha_drivers/utils/global-variables.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_geofire/flutter_geofire.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class HelperMethods {
  static void getCurrentUserInfo() async {
    currentFirebaseUser = await FirebaseAuth.instance.currentUser();
    String userId = currentFirebaseUser.uid;
    final DocumentReference document =
        Firestore.instance.collection("Users").document(userId);
    await document.get().then<dynamic>((DocumentSnapshot snapshot) async {
      if (snapshot != null) {
        currentUserInfo = User.fromSnapshot(snapshot);
        print(currentUserInfo.names);
      }
    });
  }

  static Future<DirectionDetails> getDirectionDetails(
      LatLng startPosition, LatLng endPosition) async {
    String url = 'https://maps.googleapis.com/maps/api/directions/json?origin='
        '${startPosition.latitude},'
        '${startPosition.longitude}'
        '&destination='
        '${endPosition.latitude},'
        '${endPosition.longitude}'
        '&mode=driving'
        '&key=AIzaSyCjbtso15L1Q0CMtHGTV5PTgWKLnddfbPI';
    print(url);
    var response = await RequestHelper.getRequest(url);
    print(response);
    if (response == 'failed') {
      return null;
    }
    DirectionDetails directionDetails = new DirectionDetails();
    directionDetails.durationText =
        response['routes'][0]['legs'][0]['duration']['text'];
    directionDetails.durationValue =
        response['routes'][0]['legs'][0]['duration']['value'];

    directionDetails.distanceText =
        response['routes'][0]['legs'][0]['distance']['text'];
    directionDetails.distanceValue =
        response['routes'][0]['legs'][0]['distance']['value'];

    directionDetails.encodedPoints =
        response['routes'][0]['overview_polyline']['points'];
    return directionDetails;
  }

  static void disableHomeTabLocationUpdates() {
    homeTabPositionStream.pause();
    Geofire.removeLocation(currentFirebaseUser.uid);
  }
  static int estimateFares(DirectionDetails details, int durationValue) {
    //per km = N5
    //per minute = N10
    //base fare = N40
    double baseFare = 40;
    double distanceFare = (details.distanceValue /1000) * 5;
    double timeFare = (durationValue /60) * 10;

    double totalFare = baseFare +distanceFare +timeFare;
    return totalFare.truncate();
  }

  static void enableHomeTabLocationUpdates() {
    homeTabPositionStream.resume();
    Geofire.setLocation(
        currentFirebaseUser.uid, currentPos.latitude, currentPos.latitude);
  }
  static void showProgressDialog(context){
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) =>
          CustomProgressDialog(status:'Fetching details',),);
  }
  static void getHistoryInfo (context){

    DatabaseReference earningRef = FirebaseDatabase.instance.reference().child('drivers/${currentFirebaseUser.uid}/earnings');

    earningRef.once().then((DataSnapshot snapshot){
      if(snapshot.value != null){
        String earnings = snapshot.value.toString();
        Provider.of<MainBloc>(context, listen: false).updateEarnings(earnings);
      }

    });

    DatabaseReference historyRef = FirebaseDatabase.instance.reference().child('drivers/${currentFirebaseUser.uid}/history');
    historyRef.once().then((DataSnapshot snapshot) {

      if(snapshot.value != null){

        Map<dynamic, dynamic> values = snapshot.value;
        int tripCount = values.length;

        // update trip count to data provider
        Provider.of<MainBloc>(context, listen: false).updateTripCount(tripCount);

        List<String> tripHistoryKeys = [];
        values.forEach((key, value) {tripHistoryKeys.add(key);});

        // update trip keys to data provider
        Provider.of<MainBloc>(context, listen: false).updateTripKeys(tripHistoryKeys);

        getHistoryData(context);

      }
    });


  }

  static void getHistoryData(context){

    var keys = Provider.of<MainBloc>(context, listen: false).tripHistoryKeys;

    for(String key in keys){
      DatabaseReference historyRef = FirebaseDatabase.instance.reference().child('RideRequest/$key');

      historyRef.once().then((DataSnapshot snapshot) {
        if(snapshot.value != null){

          var history = History.fromSnapshot(snapshot);
          Provider.of<MainBloc>(context, listen: false).updateTripHistory(history);

          print(history.destination);
        }
      });
    }

  }


}
