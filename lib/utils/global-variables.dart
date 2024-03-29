import 'dart:async';
import 'package:alpha_drivers/model/driver.dart';
import 'package:alpha_drivers/model/user.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

FirebaseUser currentFirebaseUser;
User currentUserInfo;
Position currentPos;
DatabaseReference rideRef;
Driver currentDriverInfo;
StreamSubscription<Position> ridePositionStream;
final assetsAudioPlayer = AssetsAudioPlayer();
StreamSubscription<Position> homeTabPositionStream;
DatabaseReference tripRequestRef;
final  CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664,
        -122.085749655962),
    zoom: 14.4746);
