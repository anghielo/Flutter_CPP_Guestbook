// import 'package:calpoly_tick_talk/services/authentication.dart';
// import 'package:flutter/material.dart';
// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:provider/provider.dart';
//
// import '../main.dart';
// import '/components/rounded_button.dart';
// import '/screens/login_screen.dart';
//
// class WelcomeScreen extends StatefulWidget {
//   // static String is used to call the page from the routes property of main
//   static String id = 'welcome_screen';
//
//   const WelcomeScreen({Key? key}) : super(key: key);
//
//   @override
//   _WelcomeScreenState createState() => _WelcomeScreenState();
// }
//
// // Adding the SingleTickerProviderStateMixin enables  _WelcomeScreenState to act as a ticker provider
// class _WelcomeScreenState extends State<WelcomeScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController controller;
//   late Animation animation;
//   late Animation tweenAnimation;
//
//   @override
//   void initState() {
//     super.initState();
//
//     controller = AnimationController(
//       duration: const Duration(seconds: 2),
//       // Ticker provider which is the object created from the class
//       vsync: this,
//     );
//
//     animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
//     tweenAnimation =
//         ColorTween(begin: Colors.green, end: Colors.white).animate(controller);
//
//     // An animation value from 0.0 to 1.0
//     controller.forward();
//     controller.addListener(() {
//       setState(() {});
//       //print(animation.value);
//     });
//   }
//
//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: tweenAnimation.value, //Colors.white,
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 24.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             Row(
//               children: <Widget>[
//                 Hero(
//                   tag: 'logo',
//                   child: SizedBox(
//                     child: Image.asset('images/logo.png'),
//                     // Animation increases the logo in size
//                     height: animation.value * 50.0,
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 TypewriterAnimatedTextKit(
//                   // '${controller.value.toInt()}%',
//                   text: const ['CPP MEETS'],
//                   textStyle: TextStyle(
//                     color: Colors.blue.shade900,
//                     fontSize: 40.0,
//                     fontWeight: FontWeight.w900,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 24.0),
//             Consumer<ApplicationState>(
//               builder: (context, appState, _) => Authentication(
//                 email: appState.email,
//                 loginState: appState.loginState,
//                 startLoginFlow: appState.startLoginFlow,
//                 verifyEmail: appState.verifyEmail,
//                 signInWithEmailAndPassword: appState.signInWithEmailAndPassword,
//                 cancelRegistration: appState.cancelRegistration,
//                 registerAccount: appState.registerAccount,
//                 signOut: appState.signOut,
//               ),
//             ),
//             // Calling created widget and passing 3 variables
//             // RoundedButton(
//             //   buttonTitle: 'Welcome! Click here',
//             //   color: const Color(0xFFF9AF0F),
//             //   onPress: () {
//             //     //Go to login screen
//             //     Navigator.pushNamed(
//             //       context,
//             //       LoginScreen.id,
//             //     );
//             //   },
//             // ),
//             // RoundedButton(
//             //   buttonTitle: 'Register',
//             //   color: const Color(0xFF16402D),
//             //   onPress: () {
//             //     //Go to registration screen
//             //     Navigator.pushNamed(
//             //       context,
//             //       RegistrationScreen.id,
//             //     );
//             //   },
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }
