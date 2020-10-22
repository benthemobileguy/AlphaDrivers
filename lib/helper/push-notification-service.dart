import 'dart:io';
import 'package:alpha_drivers/screens/components/notification-dialog.dart';
import 'package:alpha_drivers/screens/components/progress-dialog.dart';
import 'package:alpha_drivers/datamodels/trip-details.dart';
import 'package:alpha_drivers/utils/global-variables.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PushNotificationService{
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  Future initialize(context) async{
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        fetchRideInfo(getRideId(message), context);
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        fetchRideInfo(getRideId(message), context);
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
       fetchRideInfo(getRideId(message), context);
      },
    );
  }
  Future<String> getToken() async{
    String token = await _firebaseMessaging.getToken();
    print('token got as: $token');
    DatabaseReference tokenRef = FirebaseDatabase. instance.reference()
        .child('drivers/${currentFirebaseUser.uid}/token');
    tokenRef.set(token);
    _firebaseMessaging.subscribeToTopic('alldrivers');
    _firebaseMessaging.subscribeToTopic('allusers');

  }
  String getRideId(Map<String, dynamic> message){
    String rideId = '';
    print("onMessage: $message");
    if(Platform.isAndroid){
      String rideId = message['data']['ride_id'];
      print('ride_id: $rideId');
    } else{
      String rideId = message['ride_id'];
      print('ride_id: $rideId');
    }
  }
  void fetchRideInfo(String rideId, context){
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) =>
          CustomProgressDialog(status:'Fetching details',),


    );
 DatabaseReference rideRef = FirebaseDatabase.instance
     .reference().child('rideRequest/$rideId');
 rideRef.once().then((DataSnapshot snapshot){
   Navigator.pop(context);
if(snapshot.value !=null){
  double pickupLat = double.parse(snapshot.value['location']['latitude'].toString());
  double pickupLng = double.parse(snapshot.value['location']['latitude'].toString());
  String pickupAddress = snapshot.value['pickup_address'].toString();

  double destinationLat = double.parse(snapshot.value['destination']['latitude'].toString());
  double destinationLng = double.parse(snapshot.value['destination']['latitude'].toString());
  String destinationAddress = snapshot.value['destination_address'].toString();
  String paymentMethod = snapshot.value['payment_method'].toString();
  print(pickupAddress);

  TripDetails tripDetails = TripDetails();
  tripDetails.rideId  = rideId;
  tripDetails.pickupAddress = pickupAddress;
  tripDetails.destinationAddress = destinationAddress;
  tripDetails.pickup = LatLng(destinationLat, destinationLng);
  tripDetails.paymentMethod = paymentMethod;
  showDialog(context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => NotificationDialog(
        tripDetails: tripDetails,));

}
 });
  }
}