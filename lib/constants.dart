import 'package:flutter/material.dart';

const primaryColor = Color(0xff009688);
const darkPrimaryColor = Color(0xff00796B);
const lightPrimaryColor = Color(0xffB2DFDB);
const secondaryTextColor = Color(0xff757575);

const kSendButtonTextStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  hintStyle: TextStyle(fontSize: 16.0, color: secondaryTextColor),
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);
const Color login_bg = Color(0xFF00C470);
const Color signup_bg = Color(0xFF000A54);

const double defpaultPadding = 16.0;
const Duration defaultDuration = Duration(milliseconds: 300);
