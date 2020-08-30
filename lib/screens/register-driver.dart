import 'package:alpha_drivers/animations/fade-animations.dart';
import 'package:alpha_drivers/theme/style.dart';
import 'package:alpha_drivers/utils/color.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
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
  final PageController _pageController = PageController(initialPage: 0);
  bool _showPassword = false;
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();
  final _formKey4 = GlobalKey<FormState>();
  final _formKey5 = GlobalKey<FormState>();
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
                                                        if (value.isNotEmpty) {
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
                                                        if (!EmailValidator.validate(
                                                            value.trim())) {
                                                          return 'Please enter a valid email';
                                                        }
                                                        return null;
                                                      },
                                                      controller: _acctNumberController,
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
                                                      textColor: Colors.white,
                                                      fillColorCode: "#0D1724",
                                                      validator: (value) {
                                                        if (value.isNotEmpty) {
                                                          return 'Field is empty';
                                                        }
                                                        return null;
                                                      },
                                                      controller: _acctHolderName,
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
                                                      underlineColor: HexColor("#1FCD6C"),
                                                      fillColorCode: "#0D1724",
                                                      validator: (value) {
                                                        if (value.isNotEmpty) {
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
                                                        if (value.isNotEmpty) {
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
                                                        if (!EmailValidator.validate(
                                                            value.trim())) {
                                                          return 'Please enter a valid email';
                                                        }
                                                        return null;
                                                      },
                                                      controller: _acctNumberController,
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
                                                      textColor: Colors.white,
                                                      fillColorCode: "#0D1724",
                                                      validator: (value) {
                                                        if (value.isNotEmpty) {
                                                          return 'Field is empty';
                                                        }
                                                        return null;
                                                      },
                                                      controller: _acctHolderName,
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
                                                      underlineColor: HexColor("#1FCD6C"),
                                                      fillColorCode: "#0D1724",
                                                      validator: (value) {
                                                        if (value.isNotEmpty) {
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
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),//Page Two
                      Stack(
                        children: <Widget>[
                          SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: Form(
                                    autovalidate: false,
                                    key: _formKey3,
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
                                                        if (value.isNotEmpty) {
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
                                                        if (!EmailValidator.validate(
                                                            value.trim())) {
                                                          return 'Please enter a valid email';
                                                        }
                                                        return null;
                                                      },
                                                      controller: _acctNumberController,
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
                                                      textColor: Colors.white,
                                                      fillColorCode: "#0D1724",
                                                      validator: (value) {
                                                        if (value.isNotEmpty) {
                                                          return 'Field is empty';
                                                        }
                                                        return null;
                                                      },
                                                      controller: _acctHolderName,
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
                                                      underlineColor: HexColor("#1FCD6C"),
                                                      fillColorCode: "#0D1724",
                                                      validator: (value) {
                                                        if (value.isNotEmpty) {
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
                                ),
                              ],
                            ),
                          ),
                        ],
                      ), //Page Three
                      Stack(
                        children: <Widget>[
                          SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: Form(
                                    autovalidate: false,
                                    key: _formKey4,
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
                                                        if (value.isNotEmpty) {
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
                                                        if (!EmailValidator.validate(
                                                            value.trim())) {
                                                          return 'Please enter a valid email';
                                                        }
                                                        return null;
                                                      },
                                                      controller: _acctNumberController,
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
                                                      textColor: Colors.white,
                                                      fillColorCode: "#0D1724",
                                                      validator: (value) {
                                                        if (value.isNotEmpty) {
                                                          return 'Field is empty';
                                                        }
                                                        return null;
                                                      },
                                                      controller: _acctHolderName,
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
                                                      underlineColor: HexColor("#1FCD6C"),
                                                      fillColorCode: "#0D1724",
                                                      validator: (value) {
                                                        if (value.isNotEmpty) {
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
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),//Page Four
                      Stack(
                        children: <Widget>[
                          SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: Form(
                                    autovalidate: false,
                                    key: _formKey5,
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
                                                        if (value.isNotEmpty) {
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
                                                        if (!EmailValidator.validate(
                                                            value.trim())) {
                                                          return 'Please enter a valid email';
                                                        }
                                                        return null;
                                                      },
                                                      controller: _acctNumberController,
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
                                                      textColor: Colors.white,
                                                      fillColorCode: "#0D1724",
                                                      validator: (value) {
                                                        if (value.isNotEmpty) {
                                                          return 'Field is empty';
                                                        }
                                                        return null;
                                                      },
                                                      controller: _acctHolderName,
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
                                                      underlineColor: HexColor("#1FCD6C"),
                                                      fillColorCode: "#0D1724",
                                                      validator: (value) {
                                                        if (value.isNotEmpty) {
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
                                ),
                              ],
                            ),
                          ),
                        ],
                      )//Page Five
                    ],
                  ),

                ),//Expanded
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18, right: 18),
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: SmoothPageIndicator(
                            controller: _pageController,
                            count: 5,
                            effect: ScaleEffect(
                              scale: 1,
                              activeDotColor: primaryColor,
                            ),
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: (){
                            _pageController.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          },
                          child: Text(
                            "Next",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
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
}
