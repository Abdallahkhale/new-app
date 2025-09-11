import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news/Core/assets/images/imagespath.dart';
import 'package:news/UI/HomeScreen/HomeScreen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});
  static const String routeName = '/splash';

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}


class _SplashscreenState extends State<Splashscreen> {
  @override
    void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, Homescreen.routeName);
    });
  }
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body: Center(
        child: Image.asset(
          ImagesPath.logo,
          width: 300,
          height: 300,
        
        ),
      ),
    );
  }
}