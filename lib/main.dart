import 'package:flutter/material.dart';
import 'package:mr_candy/features/splash/presentetion/views/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(


      home:SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
