import 'package:flash_chat/ui/routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(FlashChatApp());

class FlashChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: AppRoutes.routes,
      initialRoute: IdScreen.welcome_screen,
    );
  }
}
