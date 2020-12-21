import 'package:alpha_drivers/utils/color.dart';
import 'package:flutter/material.dart';
class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 22,
          ),
          color: HexColor("#CFD1D3"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text('Earnings',
            style: TextStyle(
              color: HexColor("#282F39"),
              fontWeight: FontWeight.w700,
              fontFamily: 'CircularStd',)),
      ),
      body:Column(
        children: [
          ListTile(
            leading: Icon(Icons.emoji_people),
            title:Text(
              "Profile",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                fontFamily: 'Montserrat',
                color: HexColor("#241332"),
              ),
            ),
            onTap:(){

            },
          ),
          Divider(
            color: Colors.grey.withOpacity(0.5),
            height: 1,
          ),
        ],
      ),
    );
  }
}
