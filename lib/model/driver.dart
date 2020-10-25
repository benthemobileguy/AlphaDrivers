import 'package:firebase_database/firebase_database.dart';

class Driver{
String names;
String email;
String phone;
String id;
String carModel;
String carColor;
String vehicleModel;

Driver({
  this.id,
  this.names,
  this.phone,
  this.email,
  this.carColor,
  this.carModel,
  this.vehicleModel
});
Driver.fromSnapshot(DataSnapshot snapshot){
  id = snapshot.key;
  phone = snapshot.value['phone'];
  email = snapshot.value['email'];
  names = snapshot.value['names'];
  carModel = snapshot.value['vehicle_details'];
  carColor= snapshot.value['vehicle_details'];
}
}