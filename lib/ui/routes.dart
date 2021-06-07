import 'package:flash_chat/ui/screens/chat_screen.dart';
import 'package:flash_chat/ui/screens/login_screen.dart';
import 'package:flash_chat/ui/screens/registration_screen.dart';
import 'package:flash_chat/ui/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    IdScreen.chat_screen : (context) => ChatScreen(),
    IdScreen.login_screen : (context) => LoginScreen(),
    IdScreen.registration_screen : (context) => RegistrationScreen(),
    IdScreen.welcome_screen : (context) => WelcomeScreen(),
  };
}

class IdScreen {
  static const chat_screen = 'chat_screen';
  static const login_screen = 'login_screen';
  static const registration_screen = 'registration_screen';
  static const welcome_screen = 'welcome_screen';
}
