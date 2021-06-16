import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {

  final String message;
  final String sender;
  final bool isUserSender;

  MessageBubble({@required this.message, @required this.sender, @required this.isUserSender});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: isUserSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(sender, style: TextStyle(fontSize: 12, color: Colors.black54),),
          Material(
            borderRadius: BorderRadius.only(
              topLeft: isUserSender ? Radius.circular(30) : Radius.circular(0),
              topRight: isUserSender ? Radius.circular(0) : Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            elevation: 5.0,
            color: isUserSender ? Colors.lightBlueAccent : Colors.grey[300],
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                message,
                style: TextStyle(
                  color: isUserSender ? Colors.white : Colors.black87,
                  fontSize: 16
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
