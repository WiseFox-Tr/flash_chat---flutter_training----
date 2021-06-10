import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/ui/components/app_snack_bar.dart' as SnackBar;
import 'package:flash_chat/ui/routes.dart';
import 'package:flash_chat/utilities/error_manager.dart' as ErrorManager;
import 'package:flutter/material.dart';

class FlashChatBrain {

  String _inputMail;
  String _inputPassword;

  final _auth = FirebaseAuth.instance;
  User _currentUser;

  Future<void> registerCallback(BuildContext context) async {
    try{
      checkIfMailAndPasswordAreNotEmpty();
      final newUser = await _auth.createUserWithEmailAndPassword(email: _inputMail, password: _inputPassword);
      if(newUser != null)
        Navigator.pop(context);
        Navigator.pushNamed(context, IdScreen.chat_screen);
    } catch(e) {
      print('DEBUG : Exception : $e');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar.getSnackBar(ErrorManager.getErrorMessageForUser(e.toString())));
    }
  }

  Future<void> logInCallback(BuildContext context) async {
    try{
      checkIfMailAndPasswordAreNotEmpty();
      final loggedUser = await _auth.signInWithEmailAndPassword(email: _inputMail, password: _inputPassword);
      if(loggedUser != null) {
        Navigator.pushNamed(context, IdScreen.chat_screen);
      }
    } catch(e) {
      print('DEBUG : Exception : $e');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar.getSnackBar(ErrorManager.getErrorMessageForUser(e.toString())));
    }
  }

  void closeChatCallback(BuildContext context) {
    logOutUser();
    Navigator.popUntil(context, ModalRoute.withName(IdScreen.welcome_screen));
  }

  void logOutUser() => _auth.signOut();

  void findCurrentUser() {
    try {
      _currentUser = _auth.currentUser;
      if(_currentUser == null)
        throw Exception('Current user is null !');
    } catch(e) {
      print('DEBUG : Exception : $e');
    }
  }

  ///if mail or password are empty, it throws an exception.
  void checkIfMailAndPasswordAreNotEmpty() {
    if(_inputMail == null || _inputPassword == null)
      throw Exception('One required attribute is empty');
  }

  get getInputMail => _inputMail;
  get getInputPassword => _inputPassword;
  get getCurrentUserMail => _currentUser.email;
  set setInputMail(String newMail) => _inputMail = newMail;
  set setInputPassword(String newPassword) => _inputPassword = newPassword;
}
