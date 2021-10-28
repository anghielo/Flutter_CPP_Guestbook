import 'package:flutter/material.dart';
import 'package:calpoly_tick_talk/screens/welcome_screen.dart';
import 'package:calpoly_tick_talk/screens/login_screen.dart';
import 'package:calpoly_tick_talk/screens/registration_screen.dart';
import 'package:calpoly_tick_talk/screens/chat_screen.dart';

void main() => runApp(CPPChat());

class CPPChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Cannot use the 'home' property if using the routes property
      //home: WelcomeScreen(),
      debugShowCheckedModeBanner:
          false, // Turn off red debug banner phone emulator
      initialRoute: WelcomeScreen.id,
      routes: {
        // Using static variables instead for faster load
        // '/': (context) => WelcomeScreen(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ChatScreen.id: (context) => ChatScreen(),
      },
    );
  }
}
