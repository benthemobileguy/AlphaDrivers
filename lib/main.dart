import 'dart:io';
import 'package:alpha_drivers/bloc/default.dart';
import 'package:alpha_drivers/theme/style.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:provider/provider.dart';
import 'screens/welcome.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final FirebaseApp app = await FirebaseApp.configure(
    name: 'db2',
    options: Platform.isIOS
        ? const FirebaseOptions(
      googleAppID: '1:297855924061:ios:c6de2b69b03a5be8',
      gcmSenderID: '297855924061',
      databaseURL: 'https://flutterfire-cd2f7.firebaseio.com',
    )
        : const FirebaseOptions(
      googleAppID: '1:253221223869:android:18ae07ab643299ad2f26d4',
      apiKey: 'AIzaSyAmJEP2sG0AqtEecpyZL4mFac4wmt17KIA',
      databaseURL: 'https://alphataxi-6dc46.firebaseio.com',
    ),
  );
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