import 'package:flutter/material.dart';
import 'package:reubro_mtask/pages/auth/login_page.dart';
import 'package:reubro_mtask/pages/auth/otp_verification_page.dart';
import 'package:reubro_mtask/pages/auth/signup_page.dart';
import 'package:reubro_mtask/pages/home_page.dart';
import 'package:reubro_mtask/pages/select_levels_page.dart';
import 'package:reubro_mtask/services/auth_gate.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "/signupPage",
      routes: {
        "/loginPage": (_) => LoginPage(),
        "/signupPage": (_) => SignupPage(),
        "/otpVerification": (_) => OtpVerificationPage(),
        "/homePage": (_) => HomePage(),
        "/selectLevelsPage": (_) => SelectLevelsPage(),
      },
    );
  }
}
