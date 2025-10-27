import 'package:flutter/material.dart';
import 'package:reubro_mtask/core/colors.dart';

class RButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  const RButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 54),
        backgroundColor: rButtonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        )
      ),
      child: Text(text, style: TextStyle(color: rWhiteColor),),
    );
  }
}
