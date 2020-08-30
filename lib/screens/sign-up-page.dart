import 'package:alpha_drivers/animations/fade-animations.dart';
import 'package:alpha_drivers/animations/route_animations/slide_from_right_page_route.dart';
import 'package:alpha_drivers/screens/components/default-text-form-field.dart';
import 'package:alpha_drivers/screens/register-driver.dart';
import 'package:alpha_drivers/theme/style.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import 'components/custom-circular-button-main.dart';
class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _addressController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Create Profile',
      home: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/bg_welcome.png"), fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: primaryColor.withOpacity(0.8),
          body:  Padding(
            padding: const EdgeInsets.only(top: 80),
            child: SingleChildScrollView(
              child: Form(
                autovalidate: false,
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    FadeAnimation(
                      0.6,
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Create Profile",
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
                                    padding: const EdgeInsets.only(top: 20,
                                        bottom: 10,
                                        left: 20,
                                        right: 20),
                                    child: DefaultTextFormField(
                                      validator: (value) {
                                        if (value.isEmpty ||
                                            value.length < 5) {
                                          return 'Name should be at least 5 characters';
                                        }
                                        return null;
                                      },
                                      controller: _nameController,
                                      prefixIcon: Icon(
                                        Icons.person,
                                        color: Colors.grey,
                                      ),
                                      hintText: "Full Names",

                                    )
                                ),

                                Padding(
                                    padding: const EdgeInsets.only(top: 20,
                                        bottom: 10,
                                        left: 20,
                                        right: 20),
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
                                    padding: const EdgeInsets.only(top: 20,
                                        bottom: 10,
                                        left: 20,
                                        right: 20),
                                    child: DefaultTextFormField(
                                      validator: (value) {
                                        if (value.isEmpty ||
                                            value.length < 11) {
                                          return 'Phone Number should be at least 11 characters';
                                        }
                                        return null;
                                      },
                                      controller: _phoneController,
                                      keyboardType: TextInputType.number,
                                      prefixIcon: Icon(
                                        Icons.person,
                                        color: Colors.grey,
                                      ),
                                      hintText: "Phone Number",

                                    )
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(top: 20,
                                        bottom: 10,
                                        left: 20,
                                        right: 20),
                                    child: DefaultTextFormField(
                                      validator: (value) {
                                        if (value.isEmpty ||
                                            value.length < 6) {
                                          return 'Address should be at least 6 characters';
                                        }
                                        return null;
                                      },
                                      controller: _addressController,
                                      prefixIcon: Icon(
                                        Icons.contacts,
                                        color: Colors.grey,
                                      ),
                                      hintText: "Address",

                                    )
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(top: 20,
                                        bottom: 10,
                                        left: 20,
                                        right: 20),
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
                        "By continuing, I confirm that i have read & agree to the Terms & conditions and Privacy policy",
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
                    CustomCircularButtonMain(
                      onPressed: (){
                        submitForm();
                      },
                      fontWeight: FontWeight.w700,
                      isLoading: false,
                      text: "Sign Up",
                      backgroundColor: Colors.white,
                      textColor: primaryColor,
                    ),
                    SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ),
            ),
          ),

        ),
      ),
    );
  }

  void submitForm() {
    if (_formKey.currentState.validate()) {
      Navigator.pushReplacement(
          context,
          SlideFromRightPageRoute(
              widget: RegisterDriverPage()));
    }
  }
}
