import 'package:flutter/material.dart';
import 'package:reubro_mtask/pages/auth/signup_page.dart';
import 'package:reubro_mtask/pages/home_page.dart';
import 'package:reubro_mtask/services/auth_service.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  AuthService authService = AuthService();
  bool _isLoading = true;
  bool _isLoggedIn = false;


  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    _isLoggedIn = await authService.isUserLoggedIn();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return _isLoggedIn ? HomePage() : const SignupPage();
    }
  }
}
