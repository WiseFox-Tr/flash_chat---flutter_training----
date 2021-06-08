import 'package:flutter/material.dart';

class AppConst {
  static const String tagHeroLogo = 'tagHeroLogo';
  static const String tagLoginBtn = 'tagLoginBtn';
  static const String tagRegisterBtn = 'tagRegisterBtn';

  static const sendButtonTextStyle = TextStyle(
    color: Colors.lightBlueAccent,
    fontWeight: FontWeight.bold,
    fontSize: 18.0,
  );

  static const titleAppTextStyle = TextStyle(
    fontSize: 45.0,
    fontWeight: FontWeight.w900,
  );

  static const messageTextFieldDecoration = InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    hintText: 'Type your message here...',
    border: InputBorder.none,
  );

  static const messageContainerDecoration = BoxDecoration(
    border: Border(
      top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
    ),
  );

  static const textFieldInputDecoration = InputDecoration(
    hintStyle: TextStyle(color: Colors.blueGrey),
    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
  );

  static const strEnterEMail = 'Enter your email.';
  static const strEnterPassword = 'Enter your password.';
  static const strAppTitle = 'Flash Chat';
  static const strLoginBtn = 'Log In';
  static const strRegisterBtn = 'Register';
}
