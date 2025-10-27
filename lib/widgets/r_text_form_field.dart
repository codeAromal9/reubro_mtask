import 'package:flutter/material.dart';
import 'package:reubro_mtask/core/colors.dart';

class RTextFormField extends StatelessWidget {
  final TextEditingController textController;
  final TextInputType keyboardType;
  final String hintText;
  final String prefixIconPath;
  final Widget? suffixIcon;
  final bool obscureText;
  final String? Function(String?)? validator;
  // final String validatorValue;
  // final RegExp regexPattern;
  // final String invalidValue;

  const RTextFormField({
    super.key,
    required this.textController,
    required this.keyboardType,
    required this.hintText,
    required this.prefixIconPath,
    this.suffixIcon,
    required this.obscureText,
    required this.validator,
    // required this.validatorValue,
    // required this.regexPattern,
    // required this.invalidValue,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        fillColor: rWhiteColor,
        filled: true,
        hintText: hintText,
        prefixIcon: Image.asset(prefixIconPath),
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        )
      ),
      validator: validator,
      // validator: (value) {
      //   if (value == null || value.isEmpty) {
      //     return "Please enter your email address";
      //   }
      //   return null;
      // },
    );
  }
}
