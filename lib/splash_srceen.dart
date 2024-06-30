import 'dart:async';

import 'package:flutter/material.dart';
import 'package:salman/home_screen.dart';
import 'package:salman/signup_screen.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => signUp()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Center(
          child: Container(decoration: BoxDecoration(shape: BoxShape.circle,boxShadow: [BoxShadow(color: Colors.grey,
            spreadRadius: -70,
            blurRadius: 20,
            blurStyle: BlurStyle.normal,
            offset: Offset(-50,5),)]),
            child: Image(
              image: AssetImage('assets/Component 7.png'),
            ),
          )),
      backgroundColor: Color(0xffEFEFEF),
    );
  }
}
