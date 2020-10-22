import 'package:flutter/material.dart';

class CustomCircularButtonMain extends StatefulWidget {
  final Function onPressed;
  Color backgroundColor;
  String text;
  bool isLoading= false;
  FontWeight fontWeight;
  Color textColor;
  CustomCircularButtonMain({
    this.text,
    this.isLoading,
    this.fontWeight,
    this.textColor,
    this.backgroundColor,
    this.onPressed});
  @override
  _CustomCircularButtonMainState createState() => _CustomCircularButtonMainState();
}

class _CustomCircularButtonMainState extends State<CustomCircularButtonMain> {
  @override
  Widget build(BuildContext context) {
    return   GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color:widget.backgroundColor,
        ),
        width: double.infinity,
        padding: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Center(
          child: !widget.isLoading?Text(
            widget.text,
            style: TextStyle(
              fontWeight: widget.fontWeight,
              fontFamily: "OpenSans",
              color: widget.textColor,
              fontSize: 16,
            ),
          ):SizedBox(
            child: CircularProgressIndicator(
              backgroundColor:
              Colors.white,
            ),
            height: 15.0,
            width: 15.0,
          ),
        ),
      ),
    );
  }
}
