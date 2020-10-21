import 'package:alpha_drivers/utils/global-variables.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService{
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
Future initialize() async{
  _firebaseMessaging.configure(
    onMessage: (Map<String, dynamic> message) async {
      print("onMessage: $message");
    },
    onLaunch: (Map<String, dynamic> message) async {
      print("onLaunch: $message");
    },
    onResume: (Map<String, dynamic> message) async {
      print("onResume: $message");
    },
  );
}
Future<String> getToken() async{
  String token = await _firebaseMessaging.getToken();
  print('token: $token');
  DatabaseReference tokenRef = FirebaseDatabase.instance.reference()
  .child('drivers/${currentFirebaseUser.uid}/token');
  tokenRef.set(token);
  _firebaseMessaging.subscribeToTopic('alldrivers');
  _firebaseMessaging.subscribeToTopic('allusers');
}
}