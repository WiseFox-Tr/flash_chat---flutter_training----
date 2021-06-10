import 'package:flash_chat/ui/components/RoundedButton.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../../AppConst.dart';
import '../routes.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animationController.forward();
    _animationController.addListener(() => setState(() {}));
    _animation = ColorTween(begin: Colors.lightBlueAccent[100], end: Colors.white).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: AppConst.tagHeroLogo,
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                AnimatedTextKit(
                  isRepeatingAnimation: false,
                  animatedTexts: [
                    TypewriterAnimatedText(
                      AppConst.strAppTitle,
                      textStyle: AppConst.titleAppTextStyle,
                      speed: Duration(milliseconds: 200),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            Hero(
              tag: AppConst.tagLoginBtn,
              child: RoundedButton(
                label: AppConst.strLoginBtn,
                color: Colors.lightBlueAccent,
                onPressed: () => Navigator.pushNamed(context, IdScreen.login_screen),
              ),
            ),
            Hero(
              tag: AppConst.tagRegisterBtn,
              child: RoundedButton(
                label: AppConst.strRegisterBtn,
                color: Colors.blueAccent,
                onPressed: () => Navigator.pushNamed(context, IdScreen.registration_screen),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
