// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:calpoly_tick_talk/screens/chat_screen.dart';
// import 'package:calpoly_tick_talk/screens/chat_screen1.dart';
// import 'package:calpoly_tick_talk/components/message_bubble.dart';
//
// final _firestore = FirebaseFirestore.instance;
//
// class MessagesStream extends StatelessWidget {
//   const MessagesStream({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: _firestore
//           .collection('messages')
//           .orderBy('time', descending: false)
//           .snapshots(),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) {
//           return const Center(
//             child: CircularProgressIndicator(
//               backgroundColor: Colors.lightBlueAccent,
//             ),
//           );
//         }
//         // final messages = snapshot.data.documents;
//         final messages = snapshot.data!.docs.reversed;
//         // Place the messages received to a list
//         List<MessageBubble> messageBubbles = [];
//         for (var message in messages) {
//           final messageText = message.get('text');
//           final messageSender = message.get('sender');
//           final messageTime = message.get('time') as Timestamp;
//           final currentUser = loggedInUser!.email;
//
//           final messageBubble = MessageBubble(
//             sender: messageSender,
//             text: messageText,
//             isMe: currentUser == messageSender,
//             time: messageTime,
//           );
//           messageBubbles.add(messageBubble);
//         }
//         return Expanded(
//           // Expanded ListView allows the messages to be scrollable
//           child: ListView(
//             // reverse property makes it so that messages are sticky towards the bottom of the list view
//             reverse: true,
//             // Adjusts the padding of the message bubbles from the screen
//             padding:
//                 const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
//             children: messageBubbles,
//           ),
//         );
//       },
//     );
//   }
// }
