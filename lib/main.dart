import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '/pages/welcome.dart';
import '/services/application_state.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      // Comes from provider.dart (Used by Firestore)
      create: (context) =>
          ApplicationState(), // Initializes FirebaseStore and Firebase Auth instances and states
      builder: (context, _) => CPPChat(),
    ),
  );
}

class CPPChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
          false, // Turn off red debug banner phone emulator
      title: 'CPP Guestbook',
      theme: ThemeData(
        buttonTheme: Theme.of(context).buttonTheme.copyWith(
              highlightColor: Colors.deepPurple,
            ),
        primarySwatch: Colors.teal,
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const Welcome(),
    );
  }
}
