import 'package:alpha_drivers/screens/components/side-list-tile.dart';
import 'package:alpha_drivers/screens/contact-us-page.dart';
import 'package:alpha_drivers/screens/earnings-page.dart';
import 'package:alpha_drivers/screens/my-subscription-page.dart';
import 'package:alpha_drivers/screens/notifications-page.dart';
import 'package:alpha_drivers/screens/settings-page.dart';
import 'package:alpha_drivers/screens/sign-in-page.dart';
import 'package:alpha_drivers/theme/style.dart';
import 'package:alpha_drivers/utils/color.dart';
import 'package:alpha_drivers/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

import 'animations/route_animations/slide_from_left_page_route.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(left: 40),
          decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(bottomLeft:
              Radius.circular(80),
                topRight: Radius.circular(80),),
              border: Border.all(width: 3,color: primaryColor,style:
              BorderStyle.solid)
          ),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 60,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: CircleAvatar(
                  backgroundColor: Colors.grey.withOpacity(0.40),
                  radius: 41,
                  child: ClipOval(
                      child: Image.network(
                        Constants.defaultProfileImg,
                        fit: BoxFit.cover,
                        width: 80.0,
                        height: 80.0,
                      )
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Welcome, Laura",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 22.5,
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 70,
              ),

            ],
          ),
        ),
        SizedBox(
          height: 40,
        ),
        SideListTile(
          title: "Home",
          leadingIcon: Icon(Mdi.bankOutline,
            color: HexColor("#817889"),),
          onPressed: null,

        ),
        SideListTile(
          title: "Earnings",
          leadingIcon: Icon(Mdi.currencyNgn,
            color: HexColor("#817889"),),
          onPressed: (){
            Navigator.pushReplacement(
                context, SlideFromLeftPageRoute(widget:
            EarningsPage()));
          },

        ),
        SideListTile(
          title: "My Subscription",
          leadingIcon: Icon(Mdi.contactlessPaymentCircleOutline,
            color: HexColor("#817889"),),
          onPressed: (){
            Navigator.pushReplacement(
                context, SlideFromLeftPageRoute(widget:
            MySubcriptionPage()));
          },

        ),
        SideListTile(
          title: "Notifications",
          leadingIcon: Icon(Mdi.history,
            color: HexColor("#817889"),),
          onPressed: (){
            Navigator.pushReplacement(
                context, SlideFromLeftPageRoute(widget:
            NotificationsPage()));
          }

        ),
        SideListTile(
          title: "Settings",
          leadingIcon: Icon(Mdi.informationOutline,
            color: HexColor("#817889"),),
          onPressed: (){
            Navigator.pushReplacement(
                context, SlideFromLeftPageRoute(widget:
            SettingsPage()));
          },

        ),
        SideListTile(
          title: "Contact Us",
          leadingIcon: Icon(Mdi.informationOutline,
            color: HexColor("#817889"),),
          onPressed:(){
            Navigator.pushReplacement(
                context, SlideFromLeftPageRoute(widget:
            ContactUsPage()));
          },

        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Divider(
              color: Colors.grey.withOpacity(0.5),
              height: 1,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ListTile(
                onTap: (){
                  Navigator.pushReplacement(
                      context, SlideFromLeftPageRoute(widget:
                  SignInPage()));

                },
                  leading: Icon(Mdi.logout,
                    color: primaryColor,),
                  title: Text(
                    "Log out",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      fontFamily: 'Montserrat',
                      color: primaryColor,
                    ),
                  ),
              )
            ),
          ],
        ),
      ],
    );
  }
}
