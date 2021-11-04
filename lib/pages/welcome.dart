import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '/components/header.dart';
import '/components/icon_and_detail.dart';
import '/components/paragraph.dart';
import '/services/application_state.dart';
import '/services/guestbook.dart';
import '/utils/authentication.dart';

final listOfImages = <String>[
  "assets/banner/CPP_Guestbook01.png",
  "assets/banner/CPP_Guestbook02.png",
  "assets/banner/CPP_Guestbook03.png",
  "assets/banner/CPP_Guestbook04.png",
  "assets/banner/CPP_Guestbook05.png",
  "assets/banner/CPP_Guestbook06.png",
  "assets/banner/CPP_Guestbook07.png",
  "assets/banner/CPP_Guestbook08.png",
  "assets/banner/CPP_Guestbook09.png",
  "assets/banner/CPP_Guestbook10.png",
  "assets/banner/CPP_Guestbook11.png",
  "assets/banner/CPP_Guestbook12.png",
  "assets/banner/CPP_Guestbook13.png",
  "assets/banner/CPP_Guestbook14.png",
];

Random random = Random();
String randomImage() {
  int min = 0;
  int max = listOfImages.length - 1;
  int r = min + random.nextInt(max - min);
  String imageName = listOfImages[r].toString();
  return imageName;
}

// Requires intl package
String formattedDate = DateFormat.yMMMd().format(DateTime.now());

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('CPP Guestbook'),
      ),
      body: ListView(
        children: <Widget>[
          Image.asset('assets/banner/CPP_Guestbook15.png'),
          const SizedBox(height: 8),
          IconAndDetail(Icons.calendar_today_rounded, formattedDate),
          const IconAndDetail(
              Icons.school, '3801 W Temple Ave, Pomona, CA 91768'),
          Consumer<ApplicationState>(
            builder: (context, appState, _) => Authentication(
              email: appState.email,
              loginState: appState.loginState,
              startLoginFlow: appState.startLoginFlow,
              verifyEmail: appState.verifyEmail,
              signInWithEmailAndPassword: appState.signInWithEmailAndPassword,
              cancelRegistration: appState.cancelRegistration,
              registerAccount: appState.registerAccount,
              signOut: appState.signOut,
            ),
          ),
          const Divider(
            height: 8,
            thickness: 1,
            indent: 8,
            endIndent: 8,
            color: Colors.grey,
          ),
          const Header("Welcome friend :)"),
          const Paragraph(
            'Sign the Guestbook!',
          ),
          // To view publicly
          // const Header('Discussion'),
          // GuestBook(addMessage: (String message) => print(message)),
          Consumer<ApplicationState>(
            builder: (context, appState, _) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (appState.attendees >= 2)
                  Paragraph(
                      '${appState.attendees} people attended CalPoly\nDid you attend or will be attending CalPoly?')
                else if (appState.attendees == 1)
                  const Paragraph('Are you attending CalPoly?')
                else
                  const Paragraph('Are you attending CalPoly?'),
                if (appState.loginState == ApplicationLoginState.loggedIn) ...[
                  YesNoSelection(
                    state: appState.attending,
                    onSelection: (attending) => appState.attending = attending,
                  ),
                  const Header('Discussion'),
                  GuestBook(
                    addMessage: (String message) =>
                        appState.addMessageToGuestBook(message),
                    messages: appState.guestBookMessages,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
