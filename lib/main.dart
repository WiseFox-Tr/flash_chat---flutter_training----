import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat/ui/routes.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FlashChatApp());
}

class FlashChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: AppRoutes.routes,
      initialRoute: IdScreen.welcome_screen,
    );
  }
}
