import 'package:flash_chat/AppConst.dart';
import 'package:flash_chat/ui/components/RoundedButton.dart';
import 'package:flash_chat/ui/routes.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: AppConst.tagHeroLogo,
              child: Container(
                child: Image.asset('images/logo.png'),
                height: 200.0,
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              decoration: AppConst.textFieldInputDecoration.copyWith(hintText: AppConst.strEnterEMail),
              onChanged: (value) {
                //todo : Do something with the user input.
              },
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              decoration: AppConst.textFieldInputDecoration.copyWith(hintText: AppConst.strEnterPassword),
              onChanged: (value) {
                //todo : Do something with the user input.
              },
            ),
            SizedBox(
              height: 24.0,
            ),
            Hero(
              tag: AppConst.tagLoginBtn,
              child: RoundedButton(
                label: AppConst.strLoginBtn,
                color: Colors.lightBlueAccent,
                onPressed: () {
                  //todo : Implement login functionality.
                  Navigator.pushNamed(context, IdScreen.chat_screen);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
