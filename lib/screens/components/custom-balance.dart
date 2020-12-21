import 'package:alpha_drivers/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBalance extends StatelessWidget {

  final String balance;
  const CustomBalance({Key key, this.balance}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SvgPicture.asset(
          'images/blacknaira.svg',
          color: customGreenDark,
        ),
        Container(
            alignment: Alignment.topCenter,
            child: RichText(
              text: TextSpan(
                  text: '',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'CircularStd',
                      fontSize: 16),
                  children: [
                    TextSpan(
                      text: '$balance.00',
                      style: TextStyle(
                          color: Color(0xFF1A1A1A),
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Inter',
                          fontSize: 22),
                    )
                  ]),
            )),
      ],
    );
  }
}