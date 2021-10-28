import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String sender;
  final String text;
  final bool isMe;

  const MessageBubble(
      {Key? key, required this.sender, required this.text, required this.isMe})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        // crossAxisAlignment is used to move messages to the right side
        //crossAxisAlignment: CrossAxisAlignment.end,
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.black54,
            ),
          ),
          Material(
            // borderRadius: BorderRadius.circular(30.0),
            // borderRadius: BorderRadius.only(
            //   topLeft: Radius.circular(30.0),
            //   bottomLeft: Radius.circular(30.0),
            //   bottomRight: Radius.circular(30.0),
            // ),
            borderRadius: isMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  )
                : BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  ),
            // Elevation adds drop shadow to the messages
            elevation: 5.0,
            // color: Colors.blue,
            color: isMe ? Colors.blue : Colors.teal,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                // '$text from $sender',
                text,
                style: TextStyle(
                  fontSize: 15.0,
                  // color: Colors.white,
                  color: isMe ? Colors.white : Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
