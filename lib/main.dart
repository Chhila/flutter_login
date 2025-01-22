import 'package:flutter/material.dart';
import 'package:login_ui/pages/home_page.dart';
import 'package:login_ui/pages/login_page.dart';
import 'package:login_ui/pages/otp_confirmation_page.dart';
import 'package:login_ui/pages/signin_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/signin': (context) => SigninPage(),
        '/home': (context) => HomePage(),
        '/otp': (context) => OTPConfirmationPage(),
      },
    );
  }
}
