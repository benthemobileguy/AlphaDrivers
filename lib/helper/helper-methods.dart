import 'package:alpha_drivers/model/user.dart';
import 'package:alpha_drivers/utils/global-variables.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
}