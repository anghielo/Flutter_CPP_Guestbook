// import 'package:flutter/material.dart';
//
// class RoundedButton extends StatelessWidget {
//   final String buttonTitle;
//   final Color color;
//   final Function() onPress;
//
//   const RoundedButton(
//       {Key? key,
//       required this.buttonTitle,
//       required this.color,
//       required this.onPress})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 16.0),
//       child: Material(
//         elevation: 5.0,
//         color: color,
//         borderRadius: BorderRadius.circular(30.0),
//         child: MaterialButton(
//           onPressed: onPress,
//           minWidth: 200.0,
//           height: 42.0,
//           child: Text(
//             buttonTitle,
//             style: const TextStyle(color: Colors.white),
//           ),
//         ),
//       ),
//     );
//   }
// }
