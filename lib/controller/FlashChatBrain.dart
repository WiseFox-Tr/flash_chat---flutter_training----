import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/ui/routes.dart';
import 'package:flutter/cupertino.dart';

class FlashChatBrain {

  String _inputMail;
  String _inputPassword;

  final _auth = FirebaseAuth.instance;
  User _currentUser;

  Future<void> registerUser(BuildContext context) async {
    try{
      final newUser = await _auth.createUserWithEmailAndPassword(email: _inputMail, password: _inputPassword);
      if(newUser != null)
        Navigator.pushNamed(context, IdScreen.chat_screen);
    } catch(e) {
      print('DEBUG : Exception : $e');
    }
  }

  Future<void> logInUser(BuildContext context) async {
    try{
      final loggedUser = await _auth.signInWithEmailAndPassword(email: _inputMail, password: _inputPassword);
      if(loggedUser != null) {
        Navigator.pushNamed(context, IdScreen.chat_screen);
      }
    } catch(e) {
      print('DEBUG : Exception : $e');
    }
  }

  void findCurrentUser() {
    try {
      _currentUser = _auth.currentUser;
      if(_currentUser == null)
        throw Exception('Current user is null !');
    } catch(e) {
      print('DEBUG : Exception : $e');
    }
  }

  get getInputMail => _inputMail;
  get getInputPassword => _inputPassword;
  get getCurrentUserMail => _currentUser.email;
  set setInputMail(String newMail) => _inputMail = newMail;
  set setInputPassword(String newPassword) => _inputPassword = newPassword;
}
