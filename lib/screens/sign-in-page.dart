import 'package:alpha_drivers/animations/fade-animations.dart';
import 'package:alpha_drivers/animations/route_animations/slide_from_left_page_route.dart';
import 'package:alpha_drivers/animations/route_animations/slide_from_right_page_route.dart';
import 'package:alpha_drivers/screens/home-page.dart';
import 'package:alpha_drivers/screens/components/custom-circular-button-main.dart';
import 'package:alpha_drivers/screens/components/default-text-form-field.dart';
import 'package:alpha_drivers/screens/register-driver.dart';
import 'package:alpha_drivers/screens/sign-up-page.dart';
import 'package:alpha_drivers/theme/style.dart';
import 'package:alpha_drivers/utils/network-utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  bool _showPassword = false;
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
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
          backgroundColor: primaryColor.withOpacity(0.8),
          body:  SingleChildScrollView(
            child: Form(
              autovalidate: false,
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 70,
                  ),
                  FadeAnimation(
                    0.6,
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
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  FadeAnimation(
                    0.6,
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        child: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 10,
                                    right: 10,
                                    top: 20,
                                    bottom: 10,),
                                child: DefaultTextFormField(
                                  validator: (value) {
                                    if (!EmailValidator.validate(
                                        value.trim())) {
                                      return 'Please enter a valid email';
                                    }
                                    return null;
                                  },
                                  controller: _emailController,
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Colors.grey,
                                  ),
                                  hintText: "Email",

                                )
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                    right: 10,
                                    top: 20,
                                    bottom: 10,),
                                  child: DefaultTextFormField(
                                    validator: (value) {
                                      if (value.isEmpty ||
                                          value.length < 5) {
                                        return 'Password must be at least 5 characters';
                                      }
                                      return null;
                                    },
                                    controller: _passController,
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: Colors.grey,
                                    ),
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _showPassword =
                                          !_showPassword;
                                        });
                                      },
                                      child: _showPassword? Icon(
                                        Icons.visibility,
                                        color: Colors.grey,
                                      ): Icon(
                                        Icons.visibility_off,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    obscureText: !_showPassword,
                                    hintText: "Password",

                                  )
                              ),
                              SizedBox(
                                height: 50,
                              )
                            ],
                          ),
                        ),

                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:17, right: 17),
                    child: Text(
                      "By continuing, I confirm that i have read & agree to the "
                          "Terms & conditions and Privacy policy",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'CircularStd',
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: CustomCircularButtonMain(
                      onPressed: (){
                        submitForm();
                      },
                      fontWeight: FontWeight.w700,
                      isLoading: isLoading,
                      text: "Sign In",
                      backgroundColor: Colors.white,
                      textColor: primaryColor,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: CustomCircularButtonMain(
                      onPressed: (){
                        Navigator.pushReplacement(
                            context, SlideFromLeftPageRoute(widget:
                        SignUpPage()));
                      },
                      isLoading: false,
                      backgroundColor: Colors.transparent,
                      fontWeight: FontWeight.w700,
                      textColor: Colors.white,
                      text: "Sign Up",
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),

        ),
      ),
    );
  }

  void submitForm() {
    if (_formKey.currentState.validate()) {
      loginViaFirebase();
    }
  }

  void loginViaFirebase() {
    setState(() {
      isLoading = true;
    });
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passController.text.trim())
        .catchError((e) => {
      setState(() {
        isLoading = false;
      }),
    NetworkUtils.showToast("Your email or password is incorrect!"),
      print(e.toString())
    }).then((AuthResult auth) {
     checkIfDocExists(auth.user.uid);
    });
  }
  Future<bool> checkIfDocExists(String userId) async {
    try {
      // Get reference to Firestore collection
      var collectionRef = Firestore.instance.collection('Vehicles').document();
      if(collectionRef!=null){

        Navigator.pushReplacement(
            context, SlideFromLeftPageRoute(widget:
        HomePage()));
      } else{
        Navigator.pushReplacement(
            context, SlideFromLeftPageRoute(widget:
        RegisterDriverPage()));
      }
    } catch (e) {
      throw e;
    }
    setState(() {
      isLoading = false;
    });
  }
}
