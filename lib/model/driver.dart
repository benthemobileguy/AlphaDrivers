import 'package:firebase_database/firebase_database.dart';

class Driver{
String names;
String email;
String phone;
String id;
String vehicleName;
String vehicleColor;

Driver({
  this.id,
  this.names,
  this.phone,
  this.email,
  this.vehicleColor,
  this.vehicleName,
});
Driver.fromSnapshot(DataSnapshot snapshot){
  id = snapshot.key;
  phone = snapshot.value['phone'];
  email = snapshot.value['email'];
  names = snapshot.value['names'];
  vehicleName = snapshot.value['vehicle_name'];
  vehicleColor= snapshot.value['vehicle_color'];
}
}