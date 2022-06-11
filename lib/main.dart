import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:reports/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}
// StreamBuilder<User?>(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, snapshot) {
//           // if (snapshot.connectionState == ConnectionState.waiting) {
//           //   return Center(child: CircularProgressIndicator());
//           // } else if (snapshot.hasError) {
//           //   return Center(child: Text('Something went error!'));
//           // } else
//           if (snapshot.hasData) {
//             return Home();
//           } else {
//             return LogAdm();
//           }
//         },
//       ),
