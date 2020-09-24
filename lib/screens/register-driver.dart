import 'package:alpha_drivers/animations/route_animations/slide_from_left_page_route.dart';
import 'package:alpha_drivers/model/user.dart';
import 'package:alpha_drivers/screens/components/show-image-picker.dart';
import 'package:alpha_drivers/screens/home-page.dart';
import 'package:alpha_drivers/theme/style.dart';
import 'package:alpha_drivers/utils/cloudinary.dart';
import 'package:alpha_drivers/utils/color.dart';
import 'package:alpha_drivers/utils/network-utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloudinary_client/cloudinary_client.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mdi/mdi.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'components/default-text-form-field.dart';

class RegisterDriverPage extends StatefulWidget {
  @override
  _RegisterDriverPageState createState() => _RegisterDriverPageState();
}

class _RegisterDriverPageState extends State<RegisterDriverPage> {
  TextEditingController _bankController = new TextEditingController();
  TextEditingController _bvnController = new TextEditingController();
  TextEditingController _acctHolderName = new TextEditingController();
  TextEditingController _acctNumberController = new TextEditingController();
  TextEditingController _plateNumberController = new TextEditingController();
  TextEditingController _vehicleColorController = new TextEditingController();
  TextEditingController _vehicleNameController = new TextEditingController();
  TextEditingController _vehiclePhotoController = new TextEditingController();
  final PageController _pageController = PageController(initialPage: 0);
  PickedFile _image;
  List<String> _images = [];
  List<String> _paths = [];
  final picker = ImagePicker();
  ProgressDialog pr;
  bool _showPassword = false;
  int pagePos = 0;
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  // final _formKey3 = GlobalKey<FormState>();
  // final _formKey4 = GlobalKey<FormState>();
  // final _formKey5 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              children: <Widget>[
                Expanded(
                  child: PageView(
                    onPageChanged: (int page) {
                      setState(() {
                        pagePos = page;
                      });
                    },
                  physics: NeverScrollableScrollPhysics(),
                    controller: _pageController,
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: Form(
                                    autovalidate: false,
                                    key: _formKey1,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Bank Details",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              fontFamily: 'CircularStd',
                                              color: Colors.grey.withOpacity(0.7),
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(30.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: HexColor("#0D1724"),
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(20),
                                                    bottomLeft: Radius.circular(20),
                                                    bottomRight: Radius.circular(20),
                                                    topRight: Radius.circular(20))),
                                            child: Column(
                                              children: <Widget>[
                                                Padding(
                                                    padding: const EdgeInsets.only(
                                                        top: 20,
                                                        bottom: 10,
                                                        left: 20,
                                                        right: 20),
                                                    child: DefaultTextFormField(
                                                      textColor: Colors.white,
                                                      underlineColor: HexColor("#1FCD6C"),
                                                      fillColorCode: "#0D1724",
                                                      validator: (value) {
                                                        if (value.isEmpty) {
                                                          return 'Field is empty';
                                                        }
                                                        return null;
                                                      },
                                                      controller: _bankController,
                                                      prefixIcon: Icon(
                                                        Mdi.bank,
                                                        color: Colors.grey,
                                                      ),
                                                      hintText: "Bank Name",
                                                    )),
                                                Padding(
                                                    padding: const EdgeInsets.only(
                                                        top: 20,
                                                        bottom: 10,
                                                        left: 20,
                                                        right: 20),
                                                    child: DefaultTextFormField(
                                                      textColor: Colors.white,
                                                      underlineColor: HexColor("#1FCD6C"),
                                                      fillColorCode: "#0D1724",
                                                      validator: (value) {
                                                        if (value.isEmpty) {
                                                          return 'Field is empty';
                                                        }
                                                        return null;
                                                      },
                                                      controller: _acctHolderName,
                                                      prefixIcon: Icon(
                                                        Mdi.account,
                                                        color: Colors.grey,
                                                      ),
                                                      hintText: "Account Holder's Name",
                                                    )),
                                                Padding(
                                                    padding: const EdgeInsets.only(
                                                        top: 20,
                                                        bottom: 10,
                                                        left: 20,
                                                        right: 20),
                                                    child: DefaultTextFormField(
                                                      keyboardType: TextInputType.number,
                                                      textColor: Colors.white,
                                                      fillColorCode: "#0D1724",
                                                      validator: (value) {
                                                        if (value.isEmpty) {
                                                          return 'Field is empty';
                                                        }
                                                        return null;
                                                      },
                                                      controller: _acctNumberController,
                                                      prefixIcon: Icon(
                                                        Mdi.accountDetails,
                                                        color: Colors.grey,
                                                      ),
                                                      hintText: "Account Number",
                                                    )),
                                                Padding(
                                                    padding: const EdgeInsets.only(
                                                        top: 20,
                                                        bottom: 10,
                                                        left: 20,
                                                        right: 20),
                                                    child: DefaultTextFormField(
                                                      textColor: Colors.white,
                                                      keyboardType: TextInputType.number,
                                                      underlineColor: HexColor("#1FCD6C"),
                                                      fillColorCode: "#0D1724",
                                                      validator: (value) {
                                                        if (value.isEmpty) {
                                                          return 'Field is empty';
                                                        }
                                                        return null;
                                                      },
                                                      controller: _bvnController,
                                                      prefixIcon: Icon(
                                                        Mdi.finance,
                                                        color: Colors.grey,
                                                      ),
                                                      hintText: "BVN",
                                                    )),
                                                SizedBox(
                                                  height: 30,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),//Page One
                      Stack(
                        children: <Widget>[
                          SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: Form(
                                    autovalidate: false,
                                    key: _formKey2,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Vehicle Information",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              fontFamily: 'CircularStd',
                                              color: Colors.grey.withOpacity(0.7),
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(30.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: HexColor("#0D1724"),
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(20),
                                                    bottomLeft: Radius.circular(20),
                                                    bottomRight: Radius.circular(20),
                                                    topRight: Radius.circular(20))),
                                            child: Column(
                                              children: <Widget>[
                                                Padding(
                                                    padding: const EdgeInsets.only(
                                                        top: 20,
                                                        bottom: 10,
                                                        left: 20,
                                                        right: 20),
                                                    child: DefaultTextFormField(
                                                      textColor: Colors.white,
                                                      underlineColor: HexColor("#1FCD6C"),
                                                      fillColorCode: "#0D1724",
                                                      validator: (value) {
                                                        if (value.isEmpty) {
                                                          return 'Field is empty';
                                                        }
                                                        return null;
                                                      },
                                                      controller: _vehicleNameController,
                                                      prefixIcon: Icon(
                                                        Mdi.car,
                                                        color: Colors.grey,
                                                      ),
                                                      hintText: "Name of Vehicle",
                                                    )),
                                                Padding(
                                                    padding: const EdgeInsets.only(
                                                        top: 20,
                                                        bottom: 10,
                                                        left: 20,
                                                        right: 20),
                                                    child: DefaultTextFormField(
                                                      textColor: Colors.white,
                                                      underlineColor: HexColor("#1FCD6C"),
                                                      fillColorCode: "#0D1724",
                                                      validator: (value) {
                                                        if (value.isEmpty) {
                                                          return 'Field is empty';
                                                        }
                                                        return null;
                                                      },
                                                      controller: _vehicleColorController,
                                                      prefixIcon: Icon(
                                                        Mdi.selectColor,
                                                        color: Colors.grey,
                                                      ),
                                                      hintText: "Vehicle Color",
                                                    )),
                                                Padding(
                                                    padding: const EdgeInsets.only(
                                                        top: 20,
                                                        bottom: 10,
                                                        left: 20,
                                                        right: 20),
                                                    child: DefaultTextFormField(
                                                      textColor: Colors.white,
                                                      keyboardType: TextInputType.number,
                                                      underlineColor: HexColor("#1FCD6C"),
                                                      fillColorCode: "#0D1724",
                                                      validator: (value) {
                                                        if (value.isEmpty) {
                                                          return 'Field is empty';
                                                        }
                                                        return null;
                                                      },
                                                      controller: _plateNumberController,
                                                      prefixIcon: Icon(
                                                        Mdi.car,
                                                        color: Colors.grey,
                                                      ),
                                                      hintText: "Plate Number",
                                                    )),
                                                Padding(
                                                    padding: const EdgeInsets.only(
                                                        top: 20,
                                                        bottom: 10,
                                                        left: 20,
                                                        right: 20),
                                                    child: DefaultTextFormField(
                                                      textColor: Colors.white,
                                                      readOnly: true,
                                                      onTap: (){
                                                       uploadVehiclePhoto();
                                                      },
                                                      underlineColor: HexColor("#1FCD6C"),
                                                      fillColorCode: "#0D1724",
                                                      validator: (value) {
                                                        if (value.isEmpty) {
                                                          return 'Field is empty';
                                                        }
                                                        return null;
                                                      },
                                                      controller: _vehiclePhotoController,
                                                      prefixIcon: Icon(
                                                        Mdi.carConnected,
                                                        color: Colors.grey,
                                                      ),
                                                      hintText: "Vehicle Photo",
                                                    )),
                                                SizedBox(
                                                  height: 30,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 17, right: 17),
                                  child: Text(
                                    "By continuing, I confirm that i have read & agree to the "
                                        "Terms & conditions and Privacy policy",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 12.5,
                                      fontFamily: 'CircularStd',
                                      color: HexColor('#707070'),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),//Page Two
                    ],
                  ),

                ),//Expanded
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18, right: 18),
                    child: Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: (){
                            _pageController.previousPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          },
                          child: Text(
                            "Previous",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16.5,
                              fontFamily: 'OpenSans',
                              color: primaryColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Spacer(),
                        Container(
                          child: SmoothPageIndicator(
                            controller: _pageController,
                            count: 2,
                            effect: ScaleEffect(
                              scale: 1,
                              activeDotColor: primaryColor,
                            ),
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: (){
                            handleNextBtn();
                          },
                          child: Text(
                            pagePos!=1?"Next":"Complete",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16.5,
                              fontFamily: 'OpenSans',
                              color: primaryColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void handleNextBtn() {
    if(pagePos==0){
      if(_formKey1.currentState.validate()){
        _pageController.nextPage(
          duration: Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      }
    } else{
      if(_formKey2.currentState.validate()){
        if(_formKey2.currentState.validate()){
          postDetailsToFirestore();
        }
      }
    }
  }

  void postDetailsToFirestore() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final Firestore db = Firestore.instance;
    final FirebaseUser user = await auth.currentUser();
    var userRef = db.collection("Vehicles")
        .document(user.uid);
    userRef.setData({
      'user_id': user.uid,
      "bank_name": _bankController.text,
      "account_number": _acctNumberController.text,
      'account_name': _acctNumberController.text,
      'bvn': _bvnController.text,
      'vehicle_name': _vehicleNameController.text,
      'vehicle_color': _vehicleColorController.text,
      'plate_number': _plateNumberController.text,
      'vehicle_image': _images[0]

    }).then((doc) {
      print("doc save successful");
      Navigator.pushReplacement(
          context, SlideFromLeftPageRoute(widget:
      HomePage()));
      setState(() {

        NetworkUtils.showToast("Request timed out. Please try again");
      });
    }).timeout(Duration(seconds:10)).catchError((error) {
      setState(() {

        NetworkUtils.showToast("Request timed out. Please try again");
      });
      print(error);
    });
  }

  void uploadVehiclePhoto() {
    showImagePicker(context, () {
    getImageFromCamera();
    }, () {
      getImageFromGallery();
    });
  }

  Future getImageFromCamera() async {
    var selectedImg = await picker.getImage(source: ImageSource.camera);
    if (selectedImg != null) {
      pr = new ProgressDialog(context, type: ProgressDialogType.Normal);
      //Dialog Style
      pr.style(
        message: 'Uploading your image...',
        borderRadius: 10.0,
        backgroundColor: Colors.white,
        progressWidget: CircularProgressIndicator(
          strokeWidth: 3,
        ),
        elevation: 10.0,
        insetAnimCurve: Curves.bounceIn,
        progressTextStyle: TextStyle(color: Color(0xFF1C2447), fontSize: 14.0),
        messageTextStyle: TextStyle(color: Color(0xFF1C2447), fontSize: 14.0),
      );
      setState(() {
        _image = selectedImg;
      });
      uploadtoCloudinary(_image);
      Navigator.pop(context);
      pr.show();
    }
  }

  void uploadtoCloudinary(PickedFile file) async {
    CloudinaryClient client = new CloudinaryClient(Cloudinary.cloudinaryApiKey,
        Cloudinary.cloudinarySecret, Cloudinary.cloudName);
    await client.uploadImage(file.path).then((result) {
      pr.hide();
      print(result.secure_url);
      setState(() {
        _images.add(result.secure_url.toString());
        _paths.add(_image.path.split('/').last);
        _vehiclePhotoController.text = "vehicle.jpg";
      });
    }).catchError((error) =>
        print("ERROR_CLOUDINARY::  $error"));
    pr.hide();
  }

  Future getImageFromGallery() async {
    var selectedImg = await picker.getImage(source: ImageSource.gallery);
    if (selectedImg != null) {
      pr = new ProgressDialog(context, type: ProgressDialogType.Normal);
      //Dialog Style
      pr.style(
        message: 'Uploading your image...',
        borderRadius: 10.0,
        backgroundColor: Colors.white,
        progressWidget: CircularProgressIndicator(
          strokeWidth: 3,
        ),
        elevation: 10.0,
        insetAnimCurve: Curves.bounceIn,
        progressTextStyle: TextStyle(color: Color(0xFF1C2447), fontSize: 14.0),
        messageTextStyle: TextStyle(color: Color(0xFF1C2447), fontSize: 14.0),
      );
      setState(() {
        _image = selectedImg;
      });
      uploadtoCloudinary(_image);
      Navigator.pop(context);
      pr.show();
    }
  }
}
