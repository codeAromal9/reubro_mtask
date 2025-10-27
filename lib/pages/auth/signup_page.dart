import 'package:flutter/material.dart';
import 'package:reubro_mtask/core/colors.dart';
import 'package:reubro_mtask/core/constants.dart';
import 'package:reubro_mtask/services/auth_service.dart';
import 'package:reubro_mtask/widgets/r_button.dart';
import 'package:reubro_mtask/widgets/r_text_form_field.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _submitForm() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: rBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  spacing: 20,
                  children: [
                    Text("Signup", style: authTitleTextStyle,),
                    Image.asset('assets/icons/user 1.png', width: 150, height: 150,),
                    const SizedBox(height: 20,),
                    RTextFormField(
                      textController: _usernameController,
                      keyboardType: TextInputType.text,
                      hintText: 'user name',
                      prefixIconPath: 'assets/icons/Vector (1).png',
                      obscureText: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          print("Please enter your username");
                          return "Please enter your username";
                        }
                        if (value.length < 5) {
                          return "Invalid username";
                        }
                        return null;
                      },
                    ),
                    RTextFormField(
                      textController: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      hintText: 'Email Address',
                      prefixIconPath: 'assets/icons/Group.png',
                      obscureText: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your email address";
                        }
                        if (!value.contains('@') && !value.contains('.')) {
                          return "Invalid email address";
                        }
                        return null;
                      },
                    ),
                    RTextFormField(
                      textController: _passwordController,
                      keyboardType: TextInputType.text,
                      hintText: 'Password',
                      prefixIconPath: 'assets/icons/Vector.png',
                      suffixIcon: Image.asset('assets/icons/Group (1).png'),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter the password";
                        }
                        if (value.length < 6) {
                          return "Weak password";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 40,),
                    RButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _getUserInfo(context);
                          Navigator.pushReplacementNamed(context, "/otpVerification");
                        }
                      },
                      text: 'Signup',
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, "/loginPage"),
                      child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              children: <TextSpan>[
                                const TextSpan(
                                    text: 'Already have an account? ',
                                    style: TextStyle(color: rGreyColor, fontSize: 15, wordSpacing: 1)
                                ),
                                const TextSpan(
                                  text: 'Login',
                                  style: TextStyle(color: rLightBlackColor, fontSize: 15, wordSpacing: 1, fontWeight: FontWeight.bold),
                                )
                              ]
                          )
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _getUserInfo(context) async {
    AuthService authService = AuthService();
    await authService.saveUserToSharedPrefs(
        _usernameController.text,
        _emailController.text,
        _passwordController.text,
      true,
    );
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Registration successful"))
    );
  }
}
