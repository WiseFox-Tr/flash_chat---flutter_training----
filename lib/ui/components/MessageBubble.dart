import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {

  final String message;
  final String sender;

  MessageBubble({@required this.message, @required this.sender});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(sender, style: TextStyle(fontSize: 12, color: Colors.black54),),
          Material(
            borderRadius: BorderRadius.circular(30.0),
            elevation: 5.0,
            color: Colors.lightBlueAccent,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                message,
                style: TextStyle(
                  color: Colors.white,
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
