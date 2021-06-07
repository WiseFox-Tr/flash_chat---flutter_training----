import 'package:flash_chat/ui/routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(FlashChatApp());

class FlashChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.black54),
        ),
      ),
      routes: AppRoutes.routes,
      initialRoute: IdScreen.welcome_screen,
    );
  }
}
