import 'package:firebase_database/firebase_database.dart';

class Driver{
String names;
String email;
String phone;
String id;
String vehicle_name;
String vehicle_color;

Driver({
  this.id,
  this.names,
  this.phone,
  this.email,
  this.vehicle_color,
  this.vehicle_name,
});
Driver.fromSnapshot(DataSnapshot snapshot){
  id = snapshot.key;
  phone = snapshot.value['phone'];
  email = snapshot.value['email'];
  names = snapshot.value['names'];
  vehicle_name = snapshot.value['vehicle_name'];
  vehicle_color= snapshot.value['vehicle_color'];
}
}