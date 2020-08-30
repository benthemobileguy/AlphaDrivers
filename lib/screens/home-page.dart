import 'dart:async';
import 'package:alpha_drivers/bloc/default.dart';
import 'package:alpha_drivers/model/location.dart';
import 'package:alpha_drivers/side-bar.dart';
import 'package:alpha_drivers/theme/style.dart';
import 'package:alpha_drivers/utils/color.dart';
import 'package:flutter/material.dart';
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
  String _currentLocation = "Your current location";
  TextEditingController textEditingController = new TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey =  GlobalKey<ScaffoldState>();
  Completer<GoogleMapController> _controller = Completer();
  static CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664,
        -122.085749655962),
    zoom: 14.4746,
  );
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _listenForPermissionStatus();
    _getUserLocation();
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
          child: NavDrawer(

          ),
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
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
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
                  icon: Icon(Mdi.menu,
                    color: Colors.grey,),
                  onPressed: () =>{
                    _scaffoldKey.currentState.openDrawer()
                  }
              ),
            ),
          ),
        ],

      ),
    );
  }


  _tellUserToTurnOnLocation(BuildContext context) async{
    showModalBottomSheet(
        context: context,
        builder: (builder){
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
        }
    );
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

  void _getUserLocation() async{
    final position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    final GoogleMapController controller = await _controller.future;
    final CameraPosition _kLake = CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(position.latitude, position.longitude),
        tilt: 59.440717697143555,
        zoom: 19.151926040649414);
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));

    List<Placemark> placemark = await Geolocator().placemarkFromCoordinates
      (position.latitude, position.longitude);
    setState(() {
      _currentLocation = placemark[0].thoroughfare;

    });

  }

}
