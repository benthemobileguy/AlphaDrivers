import 'dart:async';
import 'dart:io';

import 'package:alpha_drivers/datamodels/trip-details.dart';
import 'package:alpha_drivers/helper/helper-methods.dart';
import 'package:alpha_drivers/screens/components/progress-dialog.dart';
import 'package:alpha_drivers/theme/brand_colors.dart';
import 'package:alpha_drivers/utils/global-variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'components/custom-circular-button-main.dart';
class NewTripPage extends StatefulWidget {
  final TripDetails tripDetails;

  const NewTripPage({Key key, this.tripDetails}) : super(key: key);
  @override
  _NewTripPageState createState() => _NewTripPageState();
}

class _NewTripPageState extends State<NewTripPage> {
  GoogleMapController mapController;
  List<LatLng> polyLineCoordinates = [];
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = Set<Marker>();
  Set<Circle> _circles = Set<Circle>();
  Set<Polyline> _polyline = Set<Polyline>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
       children: <Widget>[
         GoogleMap(
           initialCameraPosition: kGooglePlex,
           mapType: MapType.normal,
           myLocationEnabled: true,
           zoomGesturesEnabled: true,
           zoomControlsEnabled: true,
           trafficEnabled: true,
           circles: _circles,
           markers: _markers,
           polylines: _polyline,
           onMapCreated: (GoogleMapController controller) {
             _controller.complete(controller);
             mapController = controller;
             var currentLatLng = LatLng(currentPos.latitude, currentPos.longitude);
             var pickupLatLng = widget.tripDetails.pickup;



           },
         ),
         Positioned(
           left: 0,
           right: 0,
           bottom: 0,
           child: Container(
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
             child: Padding(
               padding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                Text(
                  '14 Mins',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'CircularStd',
                    color: BrandColors.colorAccentPurple,
                  ),
                ),
                   SizedBox(height: 10,),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: <Widget>[
                       Text('Daniel Jones', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, fontFamily: 'CircularStd'), ),
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Icon(Icons.call),
                      ),
                     ],
                   ),
                   SizedBox(height: 25,),
                   Row(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: <Widget>[
                       Image.asset('images/pickicon.png', height: 16, width: 16,),
                       SizedBox(width: 18,),
                       Expanded(
                         child: Container(child:
                         Text('NYSC Rd, Alakahia Nigeria',
                           style: TextStyle(fontSize: 16, fontFamily: 'CircularStd'),)),
                       ),
                     ],
                   ),
                   SizedBox(height: 15,),
                   Row(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: <Widget>[
                       Image.asset('images/desticon.png', height: 16, width: 16,),
                       SizedBox(width: 18,),
                       Expanded(child:
                       Container(child:
                       Text('SPAR, PH',
                           style: TextStyle(fontSize: 16, fontFamily: 'CircularStd')),)),
                     ],
                   ),
                   SizedBox(height: 30,),
                   SizedBox(
                     child: CustomCircularButtonMain(
                       text: 'ARRIVED',
                       fontWeight: FontWeight.w500,
                       textColor: Colors.white,
                       isLoading: false,
                       backgroundColor: BrandColors.colorTextDark,
                       onPressed: () async{

                       },
                     ),
                   ),
                 ],
               ),
             ),
           ),
         )
       ],
      ),
    );
  }
  Future<void> getDirection(LatLng pickupLatLng, LatLng destinationLatLng) async {

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) =>
          CustomProgressDialog(status: 'Please wait...'),
    );
    try {
      var thisDetails = await HelperMethods.getDirectionDetails(
          pickupLatLng, destinationLatLng);

      Navigator.pop(context);
      PolylinePoints polylinePoints = PolylinePoints();
      List<PointLatLng> results =
      polylinePoints.decodePolyline(thisDetails.encodedPoints);
      if (results.isNotEmpty) {
        //loop through all PointLatLng points and convert them
        //to a list of LatLng, required by the Polyline
        if (polyLineCoordinates != null) {
          polyLineCoordinates.clear();
        }
        results.forEach((PointLatLng point) {
          polyLineCoordinates.add(LatLng(point.latitude, point.longitude));
        });
      }
      //clear polylines before adding adding new one to avoid multiple instances.
      if (_polylines != null) {
        _polylines.clear();
      }
      setState(() {
        Polyline polyline = Polyline(
          polylineId: PolylineId('polyid'),
          color: Color.fromARGB(255, 95, 109, 237),
          points: polyLineCoordinates,
          jointType: JointType.round,
          width: 4,
          startCap: Cap.roundCap,
          endCap: Cap.roundCap,
          geodesic: true,
        ); //Polyline
        _polylines.add(polyline);
      });
      //make polyline fit into the map
      LatLngBounds latLngBounds;
      if (pickLatLng.latitude > destinationLatlng.latitude &&
          pickLatLng.longitude > destination.longitude) {
        latLngBounds =
            LatLngBounds(southwest: destinationLatlng, northeast: pickLatLng);
      } else if (pickLatLng.longitude > destinationLatlng.longitude) {
        latLngBounds = LatLngBounds(
            southwest: LatLng(pickLatLng.latitude, destinationLatlng.longitude),
            northeast: LatLng(destinationLatlng.latitude,
                pickLatLng.longitude)); //LatLngBounds
      } else if (pickLatLng.latitude > destinationLatlng.latitude) {
        latLngBounds = LatLngBounds(
            southwest: LatLng(destinationLatlng.latitude, pickLatLng.longitude),
            northeast: LatLng(pickLatLng.latitude,
                destinationLatlng.longitude)); //LatLngBounds
      } else {
        latLngBounds = LatLngBounds(
            southwest: pickLatLng, northeast: destinationLatlng); //LatLngBounds
      }
      _mapController
          .animateCamera(CameraUpdate.newLatLngBounds(latLngBounds, 70));
      //set up markers
      Marker pickUpMarker = Marker(
        markerId: MarkerId("pickup"),
        position: pickLatLng,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        infoWindow: InfoWindow(title: pickup.placeName, snippet: 'My Location'),
      );
      Marker destinationMarker = Marker(
        markerId: MarkerId("destination"),
        position: destinationLatlng,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        infoWindow: InfoWindow(title: pickup.placeName, snippet: 'Destination'),
      ); //Marker
      setState(() {
        _markers.add(pickUpMarker);
        _markers.add(destinationMarker);
      });
      //set up circles
      Circle pickUpCircle = Circle(
        circleId: CircleId('pickup'),
        strokeColor: Colors.green,
        strokeWidth: 3,
        radius: 12,
        center: pickLatLng,
        fillColor: BrandColors.colorGreen,
      ); //Circle
      Circle destinationCircle = Circle(
        circleId: CircleId('destination'),
        strokeColor: BrandColors.colorAccentPurple,
        strokeWidth: 3,
        radius: 12,
        center: destinationLatlng,
        fillColor: BrandColors.colorAccentPurple,
      ); //Circle
      setState(() {
        _circles.add(pickUpCircle);
        _circles.add(destinationCircle);
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
