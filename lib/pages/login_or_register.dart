import 'package:authentication_system/pages/login_page.dart';
import 'package:authentication_system/pages/register_page.dart';
import 'package:flutter/material.dart';

class LoginOrRegistrationPage extends StatefulWidget {
  const LoginOrRegistrationPage({super.key});

  @override
  State<LoginOrRegistrationPage> createState() =>
      _LoginOrRegistrationPageState();
}

class _LoginOrRegistrationPageState extends State<LoginOrRegistrationPage> {
  bool showLoginPage = true;

  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage == true) {
      return LoginPage(onTap: togglePages);
    } else {
      return RegisterPage(onTap: togglePages);
    }
  }
}
