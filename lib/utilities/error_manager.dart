import 'package:flash_chat/AppConst.dart';

String getErrorMessageForUser(String exceptionMessage) {
  if(exceptionMessage.contains('Given String is empty or null') || exceptionMessage.contains('One required attribute is empty'))
    return AppConst.strErrorEmptyField;
  else if(exceptionMessage.contains('[firebase_auth/invalid-email]'))
    return AppConst.strErrorInvalidEMail;
  else if(exceptionMessage.contains('[firebase_auth/weak-password]'))
    return AppConst.strErrorWeakPassword;
  else if(exceptionMessage.contains('[firebase_auth/email-already-in-use]'))
    return AppConst.strErrorEMailAlreadyInUse;
  else if(exceptionMessage.contains('[firebase_auth/user-not-found]'))
    return AppConst.strErrorUserNotFound;
  else if(exceptionMessage.contains('[firebase_auth/wrong-password]'))
    return AppConst.strErrorWrongPassword;
  else if(exceptionMessage.contains('Message field is null or empty'))
    return AppConst.strErrorMessageNullOrEmpty;
  else
    return AppConst.strErrorDefaultMessage;
}
