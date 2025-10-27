import 'package:flutter/material.dart';
import 'package:reubro_mtask/core/colors.dart';
import 'package:reubro_mtask/core/constants.dart';
import 'package:reubro_mtask/services/auth_service.dart';
import 'package:reubro_mtask/widgets/r_button.dart';
import 'package:reubro_mtask/widgets/r_text_form_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


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
                  spacing: 25,
                  children: [
                    Text("Login", style: authTitleTextStyle,),
                    Image.asset('assets/icons/lock 1.png', width: 150, height: 150,),
                    const SizedBox(height: 20,),
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
                        return null;
                      },
                    ),
                    RTextFormField(
                      textController: _passwordController,
                      keyboardType: TextInputType.text,
                      hintText: 'Password',
                      prefixIconPath: 'assets/icons/Vector.png',
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter the password";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 60,),
                    RButton(
                      onPressed: () async {
                        final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
                        final savedEmail = sharedPrefs.getString('email');
                        final savedPassword = sharedPrefs.getString('password');
                        if (savedEmail == _emailController.text.trim() && savedPassword == _passwordController.text.trim()) {
                          Navigator.pushNamed(context, "/homePage");
                        }
                      },
                      text: 'Login',
                    ),
                    const SizedBox(height: 8,),
                    SizedBox(
                      width: 250,
                      child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              children: <TextSpan>[
                                const TextSpan(
                                    text: 'By continuing, you agree to the ',
                                    style: TextStyle(color: rGreyColor, fontSize: 13, wordSpacing: 1)
                                ),
                                const TextSpan(
                                  text: 'Terms of Service & Privacy Policy',
                                  style: TextStyle(color: rLightBlackColor, fontSize: 13, wordSpacing: 1, fontWeight: FontWeight.bold),
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
      )
    );
  }

}
