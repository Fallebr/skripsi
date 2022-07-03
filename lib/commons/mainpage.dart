import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:reports/commons/splash_screen.dart';
import 'package:reports/login/logadm.dart';
import 'package:reports/kasir/kasir2.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SplashScreen();
          } else {
            return AlertDialog(
              title: const Text('Email/Password SALAH!'),
              content: const Text('Silahkan Masukkan kembali'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (
                        context,
                      ) =>
                              LogAdm())),
                  child: const Text('OK'),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
