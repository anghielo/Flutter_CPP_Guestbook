import 'package:calpoly_tick_talk/constants.dart';
import 'package:calpoly_tick_talk/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:calpoly_tick_talk/components/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
// import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  // static String is used to call the page from the routes property of main
  static String id = 'registration_screen';

  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance; // Use static instance
  late String email;
  late String password;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Flexible widget can be flexible to allow compatibility between devices
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: SizedBox(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              const SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  // User input
                  email = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'myname@cpp.edu',
                  labelText: 'Enter your email',
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  // User input
                  password = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                  hintText: '******',
                  labelText: 'Enter your password',
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              RoundedButton(
                buttonTitle: 'Register',
                color: const Color(0xFF16402D),
                onPress: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  // print('Testing registration');
                  // print(email);
                  // print(password);
                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    Navigator.pushNamed(context, ChatScreen.id);

                    setState(() {
                      showSpinner = false;
                    });
                  } catch (e) {
                    //print(e);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
