import 'package:alpha_drivers/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
final Color primaryColor = Hexcolor("#1FCD6C");
final Color textColor= HexColor("#7F7F7F");
final Color dividerColor = HexColor("#DADEE3");
final Color primaryColorDark = Hexcolor("#000000");
final Color customGreenDark = HexColor("#3DB24B");
final Color customGreenText = HexColor("#1FCD6C");
final Color bottomBarColor = Hexcolor("#090015");
final Color bottomBarActiveColor = Hexcolor("#FCFCFC");
final Color bottomBarDefaultColor = Hexcolor("#ECECEC");
final Color toolbarColor = Hexcolor("#0C001B");
final Color accentColor = Hexcolor("#C68630");
final Color accentPurple = Hexcolor("#180332");
final Color tabIndicatorColor = Hexcolor("#FF9F1C");

ThemeData appTheme = new ThemeData(
  textSelectionHandleColor: Colors.white,
  primaryColor: primaryColor,
  cursorColor: HexColor("#0D1724"),
  primaryColorDark: primaryColorDark,
  fontFamily: "Gilroy",
  primarySwatch: MaterialColor(
    HexColor.getColorFromHex("#09125D"),
    primarySwatch,
  ),
  // canvasColor: Colors.transparent,
);

TextStyle inputTextStyle = TextStyle(
  fontSize: 16.0,
  fontFamily: 'OpenSans',
  fontWeight: FontWeight.w300,
  color: Colors.white,
);
TextStyle subheadingTextStyle = const TextStyle(
    color: Colors.white,
    fontFamily: 'Gilroy',
    fontSize: 14.0,
    fontWeight: FontWeight.w100);

TextStyle bottomBarTextStyle = TextStyle(
  fontSize: 12.0,
  fontFamily: 'CircularStd',
  fontWeight: FontWeight.w500,
  color: Hexcolor("#FCFCFC"),
);

TextStyle defaultTextStyle = TextStyle(
  fontSize: 14.5,
  fontFamily: 'CircularStd',
  color: Hexcolor("#F8F5FF"),
);

Map<int, Color> primarySwatch = {
  50: Color.fromRGBO(9, 18, 93, .1),
  100: Color.fromRGBO(9, 18, 93, .2),
  200: Color.fromRGBO(9, 18, 93, .3),
  300: Color.fromRGBO(9, 18, 93, .4),
  400: Color.fromRGBO(9, 18, 93, .5),
  500: Color.fromRGBO(9, 18, 93, .6),
  600: Color.fromRGBO(9, 18, 93, .7),
  700: Color.fromRGBO(9, 18, 93, .8),
  800: Color.fromRGBO(9, 18, 93, .9),
  900: Color.fromRGBO(9, 18, 93, 1),
};