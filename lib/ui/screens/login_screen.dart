import 'package:flash_chat/AppConst.dart';
import 'package:flash_chat/controller/FlashChatBrain.dart';
import 'package:flash_chat/ui/components/RoundedButton.dart';
import 'package:flash_chat/ui/routes.dart';
import 'package:flash_chat/utilities/screen_dimensions.dart' as screenDimension;
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  FlashChatBrain _flashChatBrain = FlashChatBrain();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: _isLoading,
        child: SingleChildScrollView(
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
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.emailAddress,
                    decoration: AppConst.textFieldInputDecoration.copyWith(hintText: AppConst.strEnterEMail),
                    onChanged: (value) => _flashChatBrain.setInputMail = value,
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  TextField(
                    textAlign: TextAlign.center,
                    obscureText: true,
                    decoration: AppConst.textFieldInputDecoration.copyWith(hintText: AppConst.strEnterPassword),
                    onChanged: (value) => _flashChatBrain.setInputPassword = value,
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  Hero(
                    tag: AppConst.tagLoginBtn,
                    child: RoundedButton(
                      label: AppConst.strLoginBtn,
                      color: Colors.lightBlueAccent,
                      onPressed: () async {
                        setState(() => _isLoading = true);
                        await _flashChatBrain.logInCallback(context);
                        setState(() => _isLoading = false);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
