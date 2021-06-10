import 'package:flash_chat/AppConst.dart';
import 'package:flash_chat/controller/FlashChatBrain.dart';
import 'package:flash_chat/ui/components/RoundedButton.dart';
import 'package:flash_chat/utilities/screen_dimensions.dart' as screenDimension;
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
                    tag: AppConst.tagRegisterBtn,
                    child: RoundedButton(
                      label: AppConst.strRegisterBtn,
                      color: Colors.blueAccent,
                      onPressed: () async {
                        setState(() => _isLoading = true);
                        await _flashChatBrain.registerCallback(context);
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
