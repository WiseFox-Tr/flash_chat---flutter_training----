import 'package:flash_chat/AppConst.dart';
import 'package:flash_chat/controller/FlashChatBrain.dart';
import 'package:flash_chat/ui/components/RoundedButton.dart';
import 'package:flash_chat/utilities/screen_dimensions.dart' as screenDimension;
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  FlashChatBrain _flashChatBrain = FlashChatBrain();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: SizedBox(
            height: screenDimension.getPercentOfScreenHeight(context, 100),
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
                    _flashChatBrain.setInputMail = value;
                    //todo : Do something with the user input.
                  },
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  decoration: AppConst.textFieldInputDecoration.copyWith(hintText: AppConst.strEnterPassword),
                  onChanged: (value) {
                    _flashChatBrain.setInputPassword = value;
                    //todo : Do something with the user input.
                  },
                ),
                SizedBox(
                  height: 24.0,
                ),
                Hero(
                  tag: AppConst.tagRegisterBtn,
                  child: RoundedButton(
                    label: AppConst.strRegisterBtn,
                    color: Colors.blueAccent,
                    onPressed: () {
                      //todo : Implement register functionality.
                      print('DEBUG : mail entered : ${_flashChatBrain.getInputMail}, password entered : ${_flashChatBrain.getInputPassword}');
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
