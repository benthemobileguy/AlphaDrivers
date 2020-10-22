import 'package:flutter/material.dart';

class CustomProgressDialog extends StatelessWidget {
  final String status;

  const CustomProgressDialog({Key key, this.status}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      backgroundColor: Colors.transparent,
      child: Container(
        margin: EdgeInsets.all(16.0),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4)), //Box Decoration
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 5,
              ),
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.black54,
                ),
              ),
              SizedBox(
                width: 25.0,
              ),
              Text(
                this.status,
                style: TextStyle(
                  fontSize: 16.0,
                  color:Colors.black54,
                  fontFamily: 'CircularStd',
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
