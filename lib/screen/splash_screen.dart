import 'dart:async';
import 'package:eastern_interview/screen/camera_app.dart';
import 'package:eastern_interview/screen/camera_web_screen.dart';
import 'package:eastern_interview/screen/home_activity.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer timer;

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  void startTime() {
    timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      timer.cancel();

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => MyApp()),
            (Route<dynamic> route) => false,
      );


    });
  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: "First Demo",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.blue
      ),
      home:  HomeActivity(),
    );


  }
}
