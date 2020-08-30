import 'package:alpha_drivers/theme/style.dart';
import 'package:alpha_drivers/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DefaultTextFormField extends StatelessWidget {
  final Function onChanged;
  final Widget prefixIcon;
  final String hintText;
  final int maxLength;
  final Color underlineColor;
  final  List<TextInputFormatter> inputFormatters;
  final TextInputType keyboardType;
  final FocusNode focus, nextFocus;
  final TextInputAction textInputAction;
  final Widget suffixIcon;
  final Color textColor;
  final bool obscureText, disabled;
  final String initialValue;
  final String fillColorCode;
  final Function(String) validator;
  final TextEditingController controller;
  final VoidCallback onTap;

  DefaultTextFormField({
    this.onChanged,
    this.textColor,
    this.underlineColor,
    this.maxLength,
    this.prefixIcon,
    this.inputFormatters,
    this.keyboardType,
    this.focus,
    this.nextFocus,
    this.disabled = false,
    this.textInputAction,
    this.validator,
    this.fillColorCode = '#FFFFFF',
    this.onTap,
    this.suffixIcon,
    this.initialValue,
    this.obscureText = false,
    this.controller,
    @required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: TextFormField(
        cursorColor: primaryColor,
        controller: controller,
        onChanged: this.onChanged,
        inputFormatters: inputFormatters,
        onTap: onTap,
        initialValue: initialValue,
        textAlignVertical: TextAlignVertical.bottom,
        enabled: !disabled,
        validator: validator,
        style: TextStyle(
            fontSize: 16.0,
            fontFamily: 'CircularStd',
            fontWeight: FontWeight.w300,
            color: textColor!=null?
            textColor:
            Colors.black
        ),
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: HexColor(fillColorCode),
          contentPadding: EdgeInsets.all(18.0),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          hintText: this.hintText,
          prefixIcon: this.prefixIcon,
          prefixStyle: subheadingTextStyle,
          hintStyle: TextStyle(
            fontSize: 15.0,
            fontFamily: "CircularStd",
            color: Colors.blueGrey[300],
          ),
        ),
        focusNode: this.focus,
        obscureText: obscureText,
        textInputAction: this.textInputAction != null
            ? this.textInputAction
            : TextInputAction.done,
        onFieldSubmitted: (v) {
          if (this.nextFocus != null) {
            FocusScope.of(context).requestFocus(this.nextFocus);
          }
        },
        keyboardType:
        this.keyboardType != null ?
        this.keyboardType
            : TextInputType.text,
      ),
    );
  }
}
