import 'package:flash_chat/ui/components/MessageBubble.dart';
import 'package:flutter/material.dart';

class MessagesListView extends StatelessWidget {

  final List<MessageBubble> messageBubbles;

  MessagesListView({@required this.messageBubbles});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        children: messageBubbles,
      ),
    );
  }
}
