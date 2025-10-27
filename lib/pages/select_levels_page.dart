import 'package:flutter/material.dart';
import 'package:reubro_mtask/core/colors.dart';

class SelectLevelsPage extends StatelessWidget {
  const SelectLevelsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Column(
              spacing: 10,
              children: [
                Text('Select Levels', style: TextStyle(color: rBlackColor, fontWeight: FontWeight.bold, fontSize: 30),),
                const SizedBox(height: 20,),
                Image.asset('assets/images/Group 787.png', width: double.infinity, height: 180,),
                Image.asset('assets/images/Group 788.png', width: double.infinity, height: 180,),
                Image.asset('assets/images/Group 789.png', width: double.infinity, height: 180,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
