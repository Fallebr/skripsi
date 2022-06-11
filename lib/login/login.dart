// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';

// import '../main.dart';

// class Login extends StatefulWidget {
//   // const Login({Key? key}) : super(key: key);

//   @override
//   State<Login> createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();

//   @override
//   void dispose() {
//     emailController.dispose();
//     passwordController.dispose();

//     super.dispose();
//   }

//   @override
//   Widget buildemail(TextEditingController emailController) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Text(
//           'Email',
//           style: TextStyle(
//               color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
//         ),
//         SizedBox(
//           height: 10,
//         ),
//         Container(
//           alignment: Alignment.centerLeft,
//           decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(10),
//               boxShadow: [
//                 BoxShadow(
//                     color: Colors.black26, blurRadius: 6, offset: Offset(0, 1))
//               ]),
//           height: 60,
//           child: TextField(
//             controller: emailController,
//             cursorColor: Colors.white,
//             style: TextStyle(
//               color: Colors.black87,
//             ),
//             decoration: InputDecoration(
//                 border: InputBorder.none,
//                 contentPadding: EdgeInsets.only(top: 14),
//                 hintText: 'Email',
//                 hintStyle: TextStyle(color: Colors.black38)),
//           ),
//         ),
//         Text(
//           'Password',
//           style: TextStyle(
//               color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
//         ),
//         SizedBox(
//           height: 10,
//         ),
//         Container(
//           alignment: Alignment.centerLeft,
//           decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(10),
//               boxShadow: [
//                 BoxShadow(
//                     color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
//               ]),
//           height: 60,
//           child: TextField(
//             controller: passwordController,
//             cursorColor: Colors.white,
//             obscureText: true,
//             style: TextStyle(
//               color: Colors.black87,
//             ),
//             decoration: InputDecoration(
//                 border: InputBorder.none,
//                 contentPadding: EdgeInsets.only(top: 14),
//                 prefixIcon: Icon(Icons.lock, color: Color(0xff5ac18e)),
//                 hintText: 'Password',
//                 hintStyle: TextStyle(color: Colors.black38)),
//           ),
//         ),
//       ],
//     );
//   }

//   // Widget lupaSandi(BuildContext context) {
//   //   return Container(
//   //     alignment: Alignment.centerRight,
//   //     child: FlatButton(
//   //       onPressed: () {},
//   //       padding: EdgeInsets.only(right: 0),
//   //       child: Text(
//   //         'Forgot Password',
//   //         style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//   //       ),
//   //     ),
//   //   );
//   // }

//   Future signIn() async {
//     showDialog(
//         context: context,
//         barrierDismissible: false,
//         builder: (context) => Center(child: CircularProgressIndicator()));
//     try {
//       await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: emailController.text.trim(),
//         password: passwordController.text.trim(),
//       );
//     } on FirebaseAuthException catch (e) {
//       print(e);
//     }
//     // navigatorKey.currentState!.popUntil((route) => route());
//   }
// }
