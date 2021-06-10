import 'package:flash_chat/controller/FlashChatBrain.dart';
import 'package:flash_chat/ui/routes.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/AppConst.dart';

import '../../AppConst.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  FlashChatBrain _flashChatBrain = FlashChatBrain();

  @override
  void initState() {
    super.initState();
    _flashChatBrain.findCurrentUser();
    print('DEBUG : current user mail : ${_flashChatBrain.getCurrentUserMail}');
  }

  @override
  void dispose() {
    super.dispose();
    _flashChatBrain.logOutUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () => _flashChatBrain.closeChatCallback(context),
          ),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              decoration: AppConst.messageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        //todo : Do something with the user input.
                      },
                      decoration: AppConst.messageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      //todo : Implement send functionality.
                    },
                    child: Text(
                      'Send',
                      style: AppConst.sendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
