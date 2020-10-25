import 'package:alpha_drivers/animations/route_animations/slide_from_left_page_route.dart';
import 'package:alpha_drivers/screens/components/custom-circular-button-main.dart';
import 'package:alpha_drivers/screens/home-page.dart';
import 'package:alpha_drivers/screens/register-driver.dart';
import 'package:alpha_drivers/screens/sign-in-page.dart';
import 'package:alpha_drivers/screens/sign-up-page.dart';
import 'package:alpha_drivers/theme/style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ALPHA DRIVERS',
      home: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/bg_welcome.png"), fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.black.withOpacity(0.3),
          body: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "ALPHA\nDRIVERS",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30.0,
                      fontFamily: 'CircularStd',
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Spacer(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: CustomCircularButtonMain(
                      isLoading: false,
                      backgroundColor: primaryColor,
                      fontWeight: FontWeight.w700,
                      textColor: Colors.white,
                      text: "Sign In",
                      onPressed: () {
                        Navigator.push(context,
                            SlideFromLeftPageRoute(widget: SignInPage()));
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: CustomCircularButtonMain(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            SlideFromLeftPageRoute(widget: SignUpPage()));
                      },
                      isLoading: false,
                      backgroundColor: Colors.transparent,
                      fontWeight: FontWeight.w700,
                      textColor: Colors.white,
                      text: "Sign Up",
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void getUser() async {
    FirebaseUser currentFirebaseUser =
        await FirebaseAuth.instance.currentUser();

    if (currentFirebaseUser != null) {
      checkIfDocExists(currentFirebaseUser.uid);
    }
  }

  Future<bool> checkIfDocExists(String userId) async {
    try {
      // Get reference to Firestore collection
      await Firestore.instance
          .collection('Vehicles')
          .document(userId)
          .get()
          .then((doc) => {
                if (doc.exists)
                  {
                    Navigator.pushReplacement(
                        context, SlideFromLeftPageRoute(widget: HomePage())),
                  }
                else
                  {
                    Navigator.pushReplacement(context,
                        SlideFromLeftPageRoute(widget: RegisterDriverPage()))
                  }
              });
    } catch (e) {
      throw e;
    }
  }
}
