import 'package:flutter/material.dart';
import 'package:reubro_mtask/core/colors.dart';

class TopAuthorsTile extends StatelessWidget {
  final String profileImagePath;
  final String name;
  const TopAuthorsTile({super.key, required this.profileImagePath, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Column(
        spacing: 5,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(profileImagePath),
            radius: 38,
          ),
          Text(name, style: TextStyle(color: rBlackColor, fontSize: 15, fontWeight: FontWeight.w500),),
        ],
      ),
    );
  }
}
