import 'dart:async';
import 'package:alpha_drivers/bloc/default.dart';
import 'package:alpha_drivers/helper/helper-methods.dart';
import 'package:alpha_drivers/helper/push-notification-service.dart';
import 'package:alpha_drivers/model/location.dart';
import 'package:alpha_drivers/screens/components/custom-circular-button-main.dart';
import 'package:alpha_drivers/screens/components/notification-dialog.dart';
import 'package:alpha_drivers/screens/confirm-sheet.dart';
import 'package:alpha_drivers/side-bar.dart';
import 'package:alpha_drivers/theme/brand_colors.dart';
import 'package:alpha_drivers/theme/style.dart';
import 'package:alpha_drivers/utils/color.dart';
import 'package:alpha_drivers/utils/global-variables.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_geofire/flutter_geofire.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mdi/mdi.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MainBloc _mainBloc;
  var geolocator = Geolocator();
  var locationOptions = LocationOptions(accuracy: LocationAccuracy.bestForNavigation,
      distanceFilter: 4);
  GoogleMapController mapController;
  TextEditingController textEditingController = new TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Completer<GoogleMapController> _controller = Completer();

  var availabilityText = 'GO ONLINE';
  Color availabilityColorBg = Colors.white;
  Color availabilityColorText = Colors.brown;
  bool isAvailable = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _listenForPermissionStatus();
    HelperMethods.getCurrentUserInfo();
    getCurrentDriverInfo();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _mainBloc = Provider.of<MainBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: Container(
          child: NavDrawer(),
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          new Center(
              child: new Column(
            children: <Widget>[],
          )),
          GoogleMap(
            padding: EdgeInsets.only(top: 135),
            mapType: MapType.normal,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            initialCameraPosition: kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              _getUserLocation();
            },
          ),
          Container(
            height: 135,
            color: Colors.brown,
          ), //Container
          Positioned(
            top: 40,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 250,
                  child: CustomCircularButtonMain(
                    backgroundColor: availabilityColorBg,
                    isLoading: false,
                    text: availabilityText,
                    fontWeight: FontWeight.w700,
                    textColor: availabilityColorText,
                    onPressed: () {
                      showModalBottomSheet(context: context,
                          isDismissible: false,
                          builder: (BuildContext context) =>
                              ConfirmSheet(
                                title: (!isAvailable) ? 'GO ONLINE': 'GO OFFLINE',
                                subtitle: (!isAvailable) ? 'You are about to become available to receive trip requests'
                                : 'You will stop receiving trip requests',
                                onPressed: (){

                                  if(!isAvailable){
                                    goOnline();
                                    getLocationUpdates();
                                    Navigator.pop(context);
                                    setState(() {
                                      availabilityColorBg = primaryColor;
                                      availabilityColorText = Colors.white;
                                      availabilityText = 'GO OFFLINE';
                                      isAvailable = true;
                                    });
                                  } else{
                                  goOffline();
                                  Navigator.pop(context);
                                  //reset header state
                                  setState(() {
                                    availabilityColorBg = Colors.white;
                                    availabilityColorText = Colors.brown;
                                    availabilityText = 'GO ONLINE';
                                    isAvailable = false;
                                  });
                                  }
                                },
                              ));

                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 10,
            top: 20,
            child: Container(
              margin: EdgeInsets.only(top: 20),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  boxShadow: [new BoxShadow(blurRadius: 2.0)],
                  shape: BoxShape.circle,
                  color: Colors.white),
              child: IconButton(
                  icon: Icon(
                    Mdi.menu,
                    color: Colors.grey,
                  ),
                  onPressed: () => {_scaffoldKey.currentState.openDrawer()}),
            ),
          ),
        ],
      ),
    );
  }

  _tellUserToTurnOnLocation(BuildContext context) async {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return new Container(
            height: 350.0,
            color: Colors.transparent, //could change this to Color(0xFF737373),
            //so you don't have to change MaterialApp canvasColor
            child: new Container(
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(10.0),
                        topRight: const Radius.circular(10.0))),
                child: new Center(
                  child: new Text("This is a modal sheet"),
                )),
          );
        });
  }

  void _listenForPermissionStatus() async {
    var status = await Permission.locationWhenInUse.status;
    if (status.isUndetermined) {
      // We didn't ask for permission yet.

    }

// You can can also directly ask the permission about its status.
    if (await Permission.location.isRestricted) {
      // The OS restricts access, for example because of parental controls.
    }
  }

  void _getUserLocation() async {
    final position = await Geolocator().getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    currentPos = position;
    mapController = await _controller.future;
    //create a latlng object to navigate to
    LatLng pos = LatLng(position.latitude, position.longitude);
    CameraPosition cameraPosition = new CameraPosition(target: pos, zoom: 14);
    await mapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }
void getCurrentDriverInfo() async{
    currentFirebaseUser = await FirebaseAuth.instance.currentUser();
    PushNotificationService pushNotificationService = PushNotificationService();
    pushNotificationService.initialize(context);
    pushNotificationService.getToken();
}
  void goOnline() {
    print(currentFirebaseUser.uid);
    Geofire.initialize('driversAvailable');
    Geofire.setLocation(currentFirebaseUser.uid, currentPos.latitude, currentPos.longitude);
    tripRequestRef = FirebaseDatabase.instance.reference()
        .child('drivers/${currentFirebaseUser.uid}/newTrip');
    tripRequestRef.set('waiting');
    tripRequestRef.onValue.listen((event) {

    });
  }
  void getLocationUpdates(){
    homeTabPositionStream = geolocator.getPositionStream(locationOptions)
    .listen((Position position) {
     currentPos = position;
     if(isAvailable){
       Geofire.setLocation(currentFirebaseUser.uid, position.latitude, position.longitude);
     }
     LatLng pos = LatLng(position.latitude, position.longitude);
    mapController.animateCamera(CameraUpdate.newLatLng(pos));
    });
  }
  void goOffline(){
    Geofire.removeLocation(currentFirebaseUser.uid);
    tripRequestRef.onDisconnect();
    tripRequestRef.remove();
    tripRequestRef = null;
  }
}
