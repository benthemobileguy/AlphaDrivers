import 'package:firebase_database/firebase_database.dart';

class Driver{
String fullName;
String email;
String phone;
String id;
String carModel;
String carColor;
String vehicleModel;

Driver({
  this.id,
  this.fullName,
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
  fullName = snapshot.value['full_name'];
  carModel = snapshot.value['vehicle_details'];
  carColor= snapshot.value['vehicle_details'];
}
}