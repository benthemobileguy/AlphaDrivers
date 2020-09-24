import 'dart:async';
import 'package:alpha_drivers/bloc/default.dart';
import 'package:alpha_drivers/helper/helper-methods.dart';
import 'package:alpha_drivers/model/location.dart';
import 'package:alpha_drivers/side-bar.dart';
import 'package:alpha_drivers/theme/style.dart';
import 'package:alpha_drivers/utils/color.dart';
import 'package:alpha_drivers/utils/global-variables.dart';
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
  GoogleMapController mapController;
  TextEditingController textEditingController = new TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey =  GlobalKey<ScaffoldState>();
  Completer<GoogleMapController> _controller = Completer();
  Position currentPos;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _listenForPermissionStatus();
    HelperMethods.getCurrentUserInfo();
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

}
