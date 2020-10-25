import 'package:alpha_drivers/datamodels/direction-details.dart';
import 'package:alpha_drivers/helper/request-helper.dart';
import 'package:alpha_drivers/model/user.dart';
import 'package:alpha_drivers/utils/global-variables.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HelperMethods{

  static void getCurrentUserInfo() async {
    currentFirebaseUser = await FirebaseAuth.instance.currentUser();
    String userId = currentFirebaseUser.uid;
    final DocumentReference document =   Firestore.instance.collection("Users").document(userId);
    await document.get().then<dynamic>(( DocumentSnapshot snapshot) async{
     if(snapshot!=null){
       currentUserInfo = User.fromSnapshot(snapshot);
       print(currentUserInfo.names);
     }
    });
  }
  static Future<DirectionDetails> getDirectionDetails(LatLng startPosition, LatLng endPosition) async {
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
    directionDetails.durationText = response['routes'][0]['legs'][0]['duration']['text'];
    directionDetails.durationValue = response['routes'][0]['legs'][0]['duration']['value'];

    directionDetails.distanceText = response['routes'][0]['legs'][0]['distance']['text'];
    directionDetails.distanceValue= response['routes'][0]['legs'][0]['distance']['value'];

    directionDetails.encodedPoints = response['routes'][0]['overview_polyline']['points'];
    return directionDetails;

  }
 static void disableHomeTabLocationUpdates(){

}
}