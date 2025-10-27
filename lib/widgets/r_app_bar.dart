import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reubro_mtask/core/colors.dart';

class RAppBar extends StatelessWidget {
  const RAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
      width: double.infinity,
      height: 90,
      color: Colors.transparent,
      child: Row(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 27,
            backgroundImage: AssetImage('assets/images/Ellipse 185.png'),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Good Morning!', style: TextStyle(color: rGreyColor, fontSize: 15),),
              Text('Maktum Talukdar', style: TextStyle(color: rBlackColor, fontWeight: FontWeight.bold, fontSize: 16,),),
            ],
          ),
          const SizedBox(width: 1,),
          Container(
            width: 95,
            height: 38,
            padding: EdgeInsets.all(7.0),
            decoration: BoxDecoration(
              color: Color(0xFF41C88E),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              spacing: 5,
              children: [
                Image.asset('assets/icons/cryptocurrency 1.png', width: 22, height: 22,),
                Text('2000', style: TextStyle(color: rWhiteColor, fontSize: 18, fontWeight: FontWeight.bold),)
              ],
            ),
          ),
          Spacer(),
          Image.asset('assets/icons/Vector (2).png', width: 24, height: 30,),
        ],
      ),
    );
  }
}
