import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          return SizedBox();

        }));

      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(AppImages.logo,
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover),

    );
  }
}