import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/AppConst.dart';
import 'package:flash_chat/ui/components/MessageBubble.dart';
import 'package:flash_chat/ui/components/MessagesListView.dart';
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
      catchErrorCallback(e, context);
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
      catchErrorCallback(e, context);
    }
  }

  void closeChatCallback(BuildContext context) {
    logOutUser();
    Navigator.popUntil(context, ModalRoute.withName(IdScreen.welcome_screen));
  }

  void logOutUser() => _auth.signOut();

  void findCurrentUser(BuildContext context) {
    try {
      _currentUser = _auth.currentUser;
      if(_currentUser == null)
        throw Exception('Current user is null !');
    } catch(e) {
      catchErrorCallback(e, context);
    }
  }

  ///if mail or password are empty, it throws an exception.
  void checkIfMailAndPasswordAreNotEmpty() {
    if(_inputMail == null || _inputPassword == null || _inputMail.isEmpty || _inputPassword.isEmpty)
      throw Exception('One required attribute is null or empty');
  }

  //------------ FirebaseFirestore methods --------------//

  ///saves messages send by logged user into firestore's collection dedicated to store messages.
  ///
  /// If message to send is null or empty -> Throw an exception
  void sendMessageCallback(BuildContext context) {
    try {
      if(_inputMessageText == null || _inputMessageText.isEmpty) {
        throw Exception('Message field is null or empty');
      } else {
        _firestore.collection(AppConst.firestoreCollectionMessages).add({
          AppConst.firestoreFieldText : _inputMessageText,
          AppConst.firestoreFieldSender : _currentUser.email,
        });
      }
    } catch(e) {
      catchErrorCallback(e, context);
    }
  }

  /// gets a StreamBuilder which itself returns a List of Messages into a list View
  ///
  /// - stream = messages collection
  /// - stream builder : if data -> returns a ListView , if not -> returns circular Progress Indicator
  StreamBuilder getMessageStreamBuilder() {
    return StreamBuilder(
      stream: _firestore.collection(AppConst.firestoreCollectionMessages).snapshots(),
      builder: (context, snapshot) {
        if(!snapshot.hasData) {
          return Center(child: CircularProgressIndicator(backgroundColor: Colors.blueAccent));
        }
        //if snapshot has data, retrieves docs, prepares a list of Bubble Widgets to display messages
        //and for each doc (message), add a Message Bubble Widget into with extracted information.
        //at the end, returns a ListView
        final messagesDocs = snapshot.data.docs;
        List<MessageBubble> messageBubbles = [];
        messagesDocs.forEach((message) {
          final messageText = message.get(AppConst.firestoreFieldText);
          final sender = message.get(AppConst.firestoreFieldSender);
          messageBubbles.add(MessageBubble(message: messageText, sender: sender));
        });
        return MessagesListView(messageBubbles: messageBubbles);
      },
    );
  }

  void catchErrorCallback(Exception e, BuildContext context) {
    print('DEBUG : Exception : $e');
    ScaffoldMessenger.of(context).showSnackBar(SnackBar.getSnackBar(ErrorManager.getErrorMessageForUser(e.toString())));
  }

  get getInputMail => _inputMail;
  get getInputPassword => _inputPassword;
  get getInputMessageText => _inputMessageText;
  get getCurrentUserMail => _currentUser.email;
  set setInputMail(String newMail) => _inputMail = newMail;
  set setInputPassword(String newPassword) => _inputPassword = newPassword;
  set setInputMessageText(String newMessage) => _inputMessageText = newMessage;
}
