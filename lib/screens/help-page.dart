import 'package:alpha_drivers/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
class HelpPage extends StatefulWidget {
  @override
  _ContactUsPageState createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<HelpPage> {
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
        title: Text('Help',
            style: TextStyle(
              color: HexColor("#282F39"),
              fontWeight: FontWeight.w700,
              fontFamily: 'CircularStd',)),
      ),
      body:Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.all(10),
            leading: Icon(Icons.emoji_people),
            title:Text(
              "Terms & Conditions",
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
          ListTile(
            contentPadding: EdgeInsets.all(10),
            leading: Icon(Mdi.car),
            title:Text(
              "Privacy Policies",
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
          ListTile(
            contentPadding: EdgeInsets.all(10),
            leading: Icon(Mdi.fileDocument),
            title:Text(
              "About",
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
