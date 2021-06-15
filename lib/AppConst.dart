import 'package:flutter/material.dart';

class AppConst {
  static const String tagHeroLogo = 'tagHeroLogo';
  static const String tagLoginBtn = 'tagLoginBtn';
  static const String tagRegisterBtn = 'tagRegisterBtn';

  static const String firestoreCollectionMessages = 'messages';
  static const String firestoreFieldSender = 'sender';
  static const String firestoreFieldText = 'text';

  static const sendButtonTextStyle = TextStyle(
    color: Colors.lightBlueAccent,
    fontWeight: FontWeight.bold,
    fontSize: 18.0,
  );

  static const titleAppTextStyle = TextStyle(
    fontSize: 45.0,
    fontWeight: FontWeight.w900,
  );

  static const messageContainerDecoration = BoxDecoration(
    border: Border(
      top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
    ),
  );

  static const messageTextFieldDecoration = InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    hintText: 'Type your message here...',
    border: InputBorder.none,
  );

  static const textFieldInputDecoration = InputDecoration(
    hintStyle: TextStyle(color: Colors.blueGrey),
    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
  );

  static const strEnterEMail = 'Entrez votre email.';
  static const strEnterPassword = 'Entrez votre password.';
  static const strAppTitle = 'Flash Chat';
  static const strLoginBtn = 'Se connecter';
  static const strRegisterBtn = 'Créer un compte';

  //str error
  static const strErrorDefaultMessage = 'Un problème est survenu ...';
  static const strErrorEMailAlreadyInUse = "L'e-mail saisi est déjà utilisé ...";
  static const strErrorEmptyField = "Au moins l'un des champs est vide ...";
  static const strErrorInvalidEMail = "L'adresse e-mail fournie est mal formée ...";
  static const strErrorUserNotFound = 'Aucun utilisateur ne correspond au mail saisi ...';
  static const strErrorWeakPassword = 'Le mot de passe doit contenir au moins 6 caractères ...';
  static const strErrorWrongPassword = 'Le mot de passe saisi est invalide ...';
  static const strErrorMessageNullOrEmpty = 'Votre message doit contenir au moins 1 caractère';
}
