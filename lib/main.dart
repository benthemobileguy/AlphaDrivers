import 'package:alpha_drivers/bloc/default.dart';
import 'package:alpha_drivers/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:provider/provider.dart';
import 'screens/welcome.dart';

void main() {
  // Register all the models and services before the app starts

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
    FlutterStatusbarcolor.setNavigationBarColor(primaryColorDark);
    FlutterStatusbarcolor.setNavigationBarWhiteForeground(true);


    return ChangeNotifierProvider(
      create: (context) => MainBloc(),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        child: MaterialApp(
          title: 'Alpha Taxi',
          theme: appTheme,
          debugShowCheckedModeBanner: false,
          home: WelcomeScreen(),
          navigatorObservers: [],
        ),
      ),
    );
  }
}