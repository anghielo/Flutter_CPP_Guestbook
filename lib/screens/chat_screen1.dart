import 'package:flutter/material.dart';
import '/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:calpoly_tick_talk/components/messages_stream.dart';

final _firestore = FirebaseFirestore.instance;
final _auth = FirebaseAuth.instance;
User? loggedInUser = _auth.currentUser;

class ChatScreen extends StatefulWidget {
  // static String is used to call the page from the routes property of main
  static String id = 'chat_screen';

  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // messageTextController will be used to clear the message after "Send" is pressed
  final messageTextController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  // messageText for messages that will be saved in Firestore
  late String messageText;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = _auth.currentUser!;
      loggedInUser = user;
      // print(loggedInUser!.email);
    } catch (e) {
      // print(e);
    }
  }

  // void getMessages() async {
  //   final messages = await _firestore.collection('messages').getDocuments();
  //   for (var message in messages.documents) {
  //     print(message.data);
  //   }
  // }

  // Method will listen for stream of messages coming from Firestore
  // Method messagesStream is replaced with widget MessagesStream()
  void messagesStream() async {
    // This is how you subscribe to the Firestore collection. Firestore pushes to stream
    await for (var snapshot in _firestore.collection('messages').snapshots()) {
      for (var message in snapshot.docs) {
        // print(message.data);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                //messagesStream(); // Can be deleted after testing
                // getMessages(); // Testing if data is pulling
                // Logout user
                _auth.signOut();
                Navigator.pop(context);
              }),
        ],
        centerTitle: true,
        title: const Text('What\'s on your mind?'),
        backgroundColor: const Color(0xFF16402D),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // MessageStream calls StreamBuilder to be able to update the chat from Firestore
            const MessagesStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      // messageTextController will control the message text field
                      controller: messageTextController,
                      onChanged: (value) {
                        // The message text value becomes messageText.
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Send messages and clear the message text field
                      messageTextController.clear();
                      // messages is the collection in Firestore Database
                      _firestore.collection('messages').add({
                        'text': messageText,
                        'sender': loggedInUser!.email,
                        'time': FieldValue.serverTimestamp()
                      });
                    },
                    child: const Text(
                      'Send',
                      style: kSendButtonTextStyle,
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
