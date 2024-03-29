import 'dart:async';
import 'dart:io';
import 'package:url_launcher/url_launcher.dart';
import 'package:alpha_drivers/datamodels/trip-details.dart';
import 'package:alpha_drivers/helper/helper-methods.dart';
import 'package:alpha_drivers/helper/map-kit-helper.dart';
import 'package:alpha_drivers/screens/components/collect-payment-dialog.dart';
import 'package:alpha_drivers/screens/components/progress-dialog.dart';
import 'package:alpha_drivers/theme/brand_colors.dart';
import 'package:alpha_drivers/utils/global-variables.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
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

  Timer timer;
  int durationCounter = 0;
  String buttonTitle = 'I\'ve Arrived';
  Color buttonColor = BrandColors.colorGreen;
  Completer<GoogleMapController> _controller = Completer();
  double mapPaddingBottom = 0;
  String status = 'accepted';
  String durationString = '';
  Position myPosition;
  var geoLocator = Geolocator();
  var locationOptions =
      LocationOptions(accuracy: LocationAccuracy.bestForNavigation);

  Set<Marker> _markers = Set<Marker>();
  Set<Circle> _circles = Set<Circle>();
  Set<Polyline> _polylines = Set<Polyline>();

  BitmapDescriptor movingMarkerIcon;

  bool isRequestingDirection = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    acceptTrip();
  }

  @override
  Widget build(BuildContext context) {
    createMarker();
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(
            padding: EdgeInsets.only(bottom: mapPaddingBottom),
            initialCameraPosition: kGooglePlex,
            mapType: MapType.normal,
            myLocationEnabled: true,
            zoomGesturesEnabled: true,
            zoomControlsEnabled: true,
            trafficEnabled: true,
            circles: _circles,
            markers: _markers,
            polylines: _polylines,
            onMapCreated: (GoogleMapController controller) async {
              _controller.complete(controller);
              mapController = controller;
              setState(() {
                mapPaddingBottom = (Platform.isIOS) ? 255 : 260;
              });
              var currentLatLng =
                  LatLng(currentPos.latitude, currentPos.longitude);
              var pickupLatLng = widget.tripDetails.pickup;
              await getDirection(currentLatLng, pickupLatLng);
              getLocationUpdates();
            },
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius. only(
                      topLeft: Radius.circular(15),
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
                  ]),
              height: Platform.isIOS ? 208 : 255,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        durationString,
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'CircularStd',
                          color: BrandColors.colorAccentPurple,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            widget.tripDetails.riderName,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'CircularStd'),
                          ),
                          GestureDetector(
                            onTap: (){
                              launchCaller();
                            },
                            child: Container(
                              padding: EdgeInsets.only(right: 10),
                              child: Icon(Icons.call),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Image.asset(
                            'images/pickicon.png',
                            height: 16,
                            width: 16,
                          ),
                          SizedBox(
                            width: 18,
                          ),
                          Expanded(
                            child: Container(
                                child: Text(
                                  widget.tripDetails.pickupAddress,
                              style: TextStyle(
                                  fontSize: 16, fontFamily: 'CircularStd'),
                            )),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Image.asset(
                            'images/desticon.png',
                            height: 16,
                            width: 16,
                          ),
                          SizedBox(
                            width: 18,
                          ),
                          Expanded(
                              child: Container(
                            child: Text(widget.tripDetails.destinationAddress,
                                style: TextStyle(
                                    fontSize: 16, fontFamily: 'CircularStd')),
                          )),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        child: CustomCircularButtonMain(
                          text: buttonTitle,
                          fontWeight: FontWeight.w500,
                          textColor: Colors.white,
                          isLoading: false,
                          backgroundColor: buttonColor,
                          onPressed: () async {
                            print(status);
                            if (status == 'accepted') {
                              status = 'arrived';
                              rideRef.child('status').set(('arrived'));
                              setState(() {
                                buttonTitle = 'START TRIP';
                                buttonColor = BrandColors.colorAccentPurple;
                              });
                              await getDirection(widget.tripDetails.pickup,
                                  widget.tripDetails.destination);
                              HelperMethods.showProgressDialog(context);
                              Navigator.pop(context);
                            } else if (status == 'arrived') {
                              status = 'ontrip';
                              rideRef.child('status').set('ontrip');
                              setState(() {
                                buttonTitle = 'END TRIP';
                                buttonColor = Colors.red[900];
                              });
                              startTimer();
                            } else if (status == 'ontrip') {
                              endTrip();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> getDirection(
      LatLng pickupLatLng, LatLng destinationLatLng) async {
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
      if (pickupLatLng.latitude > destinationLatLng.latitude &&
          pickupLatLng.longitude > destinationLatLng.longitude) {
        latLngBounds =
            LatLngBounds(southwest: destinationLatLng, northeast: pickupLatLng);
      } else if (pickupLatLng.longitude > destinationLatLng.longitude) {
        latLngBounds = LatLngBounds(
            southwest:
                LatLng(pickupLatLng.latitude, destinationLatLng.longitude),
            northeast: LatLng(destinationLatLng.latitude,
                pickupLatLng.longitude)); //LatLngBounds
      } else if (pickupLatLng.latitude > destinationLatLng.latitude) {
        latLngBounds = LatLngBounds(
            southwest:
                LatLng(destinationLatLng.latitude, pickupLatLng.longitude),
            northeast: LatLng(pickupLatLng.latitude,
                destinationLatLng.longitude)); //LatLngBounds
      } else {
        latLngBounds = LatLngBounds(
            southwest: pickupLatLng,
            northeast: destinationLatLng); //LatLngBounds
      }
      mapController
          .animateCamera(CameraUpdate.newLatLngBounds(latLngBounds, 70));
      //set up markers
      Marker pickUpMarker = Marker(
        markerId: MarkerId("pickup"),
        position: pickupLatLng,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      );
      Marker destinationMarker = Marker(
        markerId: MarkerId("destination"),
        position: destinationLatLng,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
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
        center: pickupLatLng,
        fillColor: BrandColors.colorGreen,
      ); //Circle
      Circle destinationCircle = Circle(
        circleId: CircleId('destination'),
        strokeColor: BrandColors.colorAccentPurple,
        strokeWidth: 3,
        radius: 12,
        center: destinationLatLng,
        fillColor: BrandColors.colorAccentPurple,
      ); //Circle
      setState(() {
        _circles.add(pickUpCircle);
        _circles.add(destinationCircle);
      });
    } catch (e) {
      print("Error:" + e.toString());
    }
  }

  void acceptTrip() {
    String rideId = widget.tripDetails.rideId;
    rideRef =
        FirebaseDatabase.instance.reference().child('RideRequest/$rideId');
    rideRef.child('status').set('accepted');
    rideRef.child('driver_name').set(currentDriverInfo.names);
    rideRef.child('car_details').set('${currentDriverInfo.vehicle_color} -'
        ' ${currentDriverInfo.vehicle_name}');
    rideRef.child('driver_phone').set(currentDriverInfo.phone);
    rideRef.child('driver_id').set(currentDriverInfo.id);

    Map locationMap = {
      'latitude': currentPos.latitude.toString(),
      'longitude': currentPos.longitude.toString()
    };
    rideRef.child('driver_location').set(locationMap);
    DatabaseReference historyRef = FirebaseDatabase().reference()
        .child('drivers/${currentFirebaseUser.uid}/history/$rideId');
    historyRef.set(true);

  }

  void createMarker() {
    if (movingMarkerIcon == null) {
      ImageConfiguration imageConfiguration =
          createLocalImageConfiguration(context, size: Size(2, 2));
      BitmapDescriptor.fromAssetImage(
              imageConfiguration,
              (Platform.isIOS)
                  ? 'images/car_ios.png'
                  : 'images/car_android.png')
          .then((icon) {
        movingMarkerIcon = icon;
      });
    }
  }

  void getLocationUpdates() {
    LatLng oldPosition = LatLng(0, 0);
    ridePositionStream = geoLocator
        .getPositionStream(locationOptions)
        .listen((Position position) {
      myPosition = position;
      currentPos = position;
      LatLng pos = LatLng(position.latitude, position.longitude);
      var rotation = MapKitHelper.getMarkerRotation(oldPosition.latitude,
          oldPosition.longitude, pos.latitude, pos.longitude);
      Marker movingMarker = Marker(
          markerId: MarkerId('moving '),
          rotation: rotation,
          position: pos,
          icon: movingMarkerIcon,
          infoWindow: InfoWindow(title: 'Current Location'));
      setState(() {
        CameraPosition cameraPosition =
            new CameraPosition(target: pos, zoom: 17);
        mapController
            .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

        _markers.removeWhere((marker) => marker.markerId.value == 'moving');
        _markers.add(movingMarker);
      });
      oldPosition = pos;
      updateTripDetails();
      Map locationMap = {
        'latitude': myPosition.latitude.toString(),
        'longitude': myPosition.longitude.toString()
      };
      rideRef.child('driver_location').set(locationMap);
    });
  }

  void updateTripDetails() async {
    if (!isRequestingDirection) {
      isRequestingDirection = true;
      if (myPosition == null) {
        return;
      }
      var positionLatLng = LatLng(myPosition.latitude, myPosition.longitude);
      LatLng destinationLatLng;
      if (status == 'accepted') {
        destinationLatLng = widget.tripDetails.pickup;
      } else {
        destinationLatLng = widget.tripDetails.destination;
      }
      var directionDetails = await HelperMethods.getDirectionDetails(
          positionLatLng, destinationLatLng);
      if (directionDetails != null) {
        setState(() {
          durationString = directionDetails.durationText;
        });
      }
      isRequestingDirection = false;
    }
  }

  void startTimer() {
    const interval = Duration(seconds: 1);
    timer = Timer.periodic(interval, (timer) {
      durationCounter++;
    });
  }

  void endTrip() async {
    timer.cancel();
    HelperMethods.showProgressDialog(context);
    var currentLatLng = LatLng(myPosition.latitude, myPosition.longitude);
    var directionDetails = await HelperMethods.getDirectionDetails(
        widget.tripDetails.pickup, currentLatLng);
    Navigator.pop(context);
    int fares = HelperMethods.estimateFares(directionDetails, durationCounter);
    rideRef.child('fares').set(fares.toString());
    rideRef.child('status').set('ended');
    ridePositionStream.cancel();
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => CollectPayment(
        paymentMethod: widget.tripDetails.paymentMethod,
        fares: fares,
      ),
    );
    topUpEarnings(fares);
  }

  void topUpEarnings(int fares) {
    DatabaseReference earningsRef = FirebaseDatabase.instance
        .reference()
        .child('drivers/${currentFirebaseUser.uid}/earnings');
    earningsRef.once().then((DataSnapshot snapshot) {
      if (snapshot.value != null) {
        double oldEarnings = double.parse(snapshot.value.toString());
        double adjustedFares = (fares.toDouble() * 0.85) + oldEarnings;
        earningsRef.set(adjustedFares.toStringAsFixed(2));
      } else {
        double adjustedFares = (fares.toDouble() * 0.85);
        earningsRef.set(adjustedFares.toStringAsFixed(2));
      }
    });
  }

  void launchCaller() async {
    var telNumber = "tel: ${'08100599608'}";
    if (await canLaunch(telNumber)) {
      await launch(telNumber);
    } else {
      throw 'could not launch $telNumber';
    }
  }
}
