import 'dart:async';

import 'package:flutter/material.dart';
import 'package:reubro_mtask/core/colors.dart';
import 'package:reubro_mtask/core/constants.dart';
import 'package:reubro_mtask/pages/auth/widgets/otp_box.dart';
import 'package:reubro_mtask/widgets/r_button.dart';

class OtpVerificationPage extends StatefulWidget {
  const OtpVerificationPage({super.key});

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {

  late Timer _timer;
  int _secondsRemaining = 5;
  bool _isTimerActive = true;

  @override
  void initState() {
    super.initState();
    startTimer();
    //_timer = Timer(Duration(seconds: 30), () => Navigator.pushReplacementNamed(context, "/homePage"));
  }

  void startTimer() {
    //const thirtySecond = Duration(seconds: 5);
    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        setState(() {
          timer.cancel();
          _isTimerActive = false;
          Navigator.pushReplacementNamed(context, "/homePage");
          print("Countdown finished");
        });
      }
    });
  }


  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: !_isTimerActive,
      onPopInvoked: (bool didPop) {
        if (!didPop) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Can't go back while timer is running!"))
          );
        }
      },
      child: Scaffold(
        backgroundColor: rBackgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  spacing: 25,
                  children: [
                    Text("Verification", style: authTitleTextStyle,),
                    Image.asset('assets/icons/verified 1.png', width: 150, height: 150,),
                    SizedBox(
                      width: 270,
                      child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              children: <TextSpan>[
                                const TextSpan(
                                    text: 'OTP has been sent on your registered mobile number ',
                                    style: TextStyle(color: rGreyColor, fontSize: 15, wordSpacing: 1)
                                ),
                                const TextSpan(
                                  text: '+91 9856214785',
                                  style: TextStyle(color: rLightBlackColor, fontSize: 15, wordSpacing: 1, fontWeight: FontWeight.bold),
                                )
                              ]
                          )
                      ),
                    ),
                    const SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(4, (index) {
                        return SizedBox(
                            width: 60,
                            height: 60,
                            child: OtpBox()
                        );
                      }),
                    ),
                    const SizedBox(height: 15,),
                    Text("00:$_secondsRemaining", style: TextStyle(color: rLightBlackColor, fontWeight: FontWeight.bold, fontSize: 18),),
                    RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            children: <TextSpan>[
                              const TextSpan(
                                  text: "Didn't Receive Code  ",
                                  style: TextStyle(color: rLightBlackColor, fontWeight: FontWeight.bold, fontSize: 15,)
                              ),
                              const TextSpan(
                                text: 'Resend Now',
                                style: TextStyle(color: rButtonColor, fontSize: 15, fontWeight: FontWeight.bold),
                              )
                            ]
                        )
                    ),
                    RButton(onPressed: () {}, text: 'Verify'),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
