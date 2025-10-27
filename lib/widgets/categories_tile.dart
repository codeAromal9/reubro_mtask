import 'package:flutter/material.dart';
import 'package:reubro_mtask/core/colors.dart';
import 'package:reubro_mtask/core/constants.dart';

class CategoriesTile extends StatelessWidget {
  final String title;
  final String imagePath;
  final color;
  final Function()? onTap;

  const CategoriesTile({
    super.key,
    required this.title,
    required this.imagePath,
    required this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: color,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [
            Image.asset(imagePath, width: 70, height: 70,),
            Text(title, style: const TextStyle(color: rWhiteColor, fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
          ],
        ),
      ),
    );
  }
}
