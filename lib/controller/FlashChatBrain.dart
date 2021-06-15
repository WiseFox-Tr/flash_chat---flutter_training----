import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/AppConst.dart';
import 'package:flash_chat/ui/components/app_snack_bar.dart' as SnackBar;
import 'package:flash_chat/ui/routes.dart';
import 'package:flash_chat/utilities/error_manager.dart' as ErrorManager;
import 'package:flutter/material.dart';

class FlashChatBrain {

  String _inputMail;
  String _inputPassword;
  String _inputMessageText;
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
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

  //------------ FirebaseFirestore methods --------------//

  ///save message send by logged user into firestore's collection dedicated to store messages.
  void sendMessageCallback(String sender) {
    if(_inputMessageText != null) {
      _firestore.collection(AppConst.firestoreCollectionMessages).add({
        AppConst.firestoreFieldText : _inputMessageText,
        AppConst.firestoreFieldSender : sender,
      });
    }
    //todo : throw exception if null
  }

  /// gets a StreamBuilder which itself returns a List of Messages into a Column
  ///
  /// - stream = messages collection
  /// - stream builder : if data -> Column of message & sender, if not -> circular Progress Indicator
  StreamBuilder getMessageStreamBuilder() {
    return StreamBuilder(
      stream: _firestore.collection(AppConst.firestoreCollectionMessages).snapshots(),
      builder: (context, snapshot) {
        if(!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(backgroundColor: Colors.blueAccent),
          );
        }
        final messagesDocs = snapshot.data.docs;
        List<Text> messageWidgets = [];
        messagesDocs.forEach((message) {
          final messageText = message.get(AppConst.firestoreFieldText);
          final sender = message.get(AppConst.firestoreFieldSender);
          messageWidgets.add(Text('$messageText from $sender'));
        });
        return Column(children: messageWidgets);
      },
    );
  }

  get getInputMail => _inputMail;
  get getInputPassword => _inputPassword;
  get getInputMessageText => _inputMessageText;
  get getCurrentUserMail => _currentUser.email;
  set setInputMail(String newMail) => _inputMail = newMail;
  set setInputPassword(String newPassword) => _inputPassword = newPassword;
  set setInputMessageText(String newMessage) => _inputMessageText = newMessage;
}
