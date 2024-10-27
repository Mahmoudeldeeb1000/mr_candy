import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mr_candy/features/onbording/presentetion/views/onbording_screen.dart';

import '../../../../core/utiles/app_images.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState(){
    super.initState();
    Future.delayed(Duration
      (
        seconds: 3
    ),
          () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) {
          return OnbordingScreen();
        }));

      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5C23CD),
      body: Container(
        child: Center(
          child: Image.asset(AppImages.logo,

              height: 100,
              width: 100,
              fit: BoxFit.cover),
        ),
      )

    );
  }
}