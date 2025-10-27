import 'package:flutter/material.dart';
import 'package:reubro_mtask/core/colors.dart';

class OtpBox extends StatelessWidget {
  const OtpBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center ,
      decoration: BoxDecoration(
        color: rWhiteColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.next,
        maxLines: 1,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
      ),
    );
  }
}
