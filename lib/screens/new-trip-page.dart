import 'dart:async';
import 'dart:io';

import 'package:alpha_drivers/datamodels/trip-details.dart';
import 'package:alpha_drivers/theme/brand_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class NewTripPage extends StatefulWidget {
  final TripDetails tripDetails;

  const NewTripPage({Key key, this.tripDetails}) : super(key: key);
  @override
  _NewTripPageState createState() => _NewTripPageState();
}

class _NewTripPageState extends State<NewTripPage> {
  GoogleMapController mapController;
  Completer<GoogleMapController> _controller = Completer();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
       children: <Widget>[
         GoogleMap(
           mapType: MapType.normal,
           myLocationEnabled: true,
           zoomGesturesEnabled: true,
           zoomControlsEnabled: true,
           onMapCreated: (GoogleMapController controller) {
             _controller.complete(controller);
             mapController = controller;
           },
         ),
         Container(
           decoration: BoxDecoration(
             color: Colors.white,
             borderRadius: BorderRadius.only(topLeft: Radius.circular(15),
                 topRight: Radius.circular((15))),
               boxShadow: [
                 BoxShadow(
                   color: Colors.black26,
                   blurRadius: 15, //soften the shadow
                   spreadRadius: 0.5,
                   offset: Offset(
                     0.7, //Move to right 10 horizontally
                     0.7, //Move to bottom 10 vertically
                   ), //Offset
                 ), //BoxShadow
               ]
           ),
           height: Platform.isIOS? 208:255,
           child: Column(
             children: <Widget>[
            Text(
              '14 Mins',
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'CircularStd',
                color: BrandColors.colorAccentPurple,
              ),
            ),
               SizedBox(height: 5,),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: <Widget>[
                   Text('Daniel Jones', style: TextStyle(fontSize: 22, fontFamily: 'CircularStd'), ),
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(Icons.call),
                  ),
                 ],
               )
             ],
           ),
         )
       ],
      ),
    );
  }
}
