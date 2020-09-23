
import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String id;
  String Address;
  Timestamp createdAt;
  String email;
  String imageurl;
  String names;
  String password;
  String phone;
  String platform;
  String role;
  String userId;

  User(){
    this.phone;
    this.id;
    this.email;
    this.Address;
    this.createdAt;
    this.imageurl;
    this.names;
    this.password;
    this.platform;
    this.role;
    this.userId;
  }
User.fromSnapshot(DocumentSnapshot snapshot){
    id = snapshot.documentID;
    phone = snapshot.data['phone'];
    email = snapshot.data['email'];
    Address = snapshot.data['Address'];
    createdAt = snapshot.data['createdAt'];
    imageurl = snapshot.data['imageurl'];
    names = snapshot.data['names'];
    password = snapshot.data['password'];
    platform = snapshot.data['platform'];
    role = snapshot.data['role'];
    userId = snapshot.data['userId'];



}
}