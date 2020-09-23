import 'package:alpha_drivers/theme/style.dart';
import 'package:flutter/material.dart';

void showImagePicker(BuildContext context, Function cameraFunction, galleryFunction) {
  showModalBottomSheet(
      context: context,
      // isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0))),
      builder: (context) {
        return Container(
          height: 250,
          margin: EdgeInsets.only(top: 20),
          decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(30.0)),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              FlatButton(
                onPressed: cameraFunction,
                child: Text(
                  "From Camera",
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 16.0,
                    fontFamily: 'CircularStd',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              FlatButton(
                onPressed: galleryFunction,
                child: Text(
                  "From File Explorer",
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 16.0,
                    fontFamily: 'CircularStd',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "CANCEL",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 17.0,
                    fontFamily: 'CircularStd',
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ),
            ],
          ),
        );
      });
}