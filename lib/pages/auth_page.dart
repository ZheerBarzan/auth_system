import 'package:authentication_system/pages/home_page.dart';
import 'package:authentication_system/pages/login_or_register.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //user logged in
          if (snapshot.hasData) {
            return HomePage();
          } else {
            return const LoginOrRegistrationPage();
          }

          //user not logged in
        },
      ),
    );
  }
}
