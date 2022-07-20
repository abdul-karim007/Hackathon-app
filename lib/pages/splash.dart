import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hackathonapp/consts/color.dart';
import 'package:hackathonapp/consts/img.dart';
import 'package:hackathonapp/pages/aftersplash1.dart';
import 'package:hackathonapp/pages/aftersplash2.dart';
import 'package:hackathonapp/pages/loginPage.dart';
import 'package:hackathonapp/pages/mainSplash.dart';

class CustomSplash extends StatefulWidget {
  const CustomSplash({Key? key}) : super(key: key);

  @override
  State<CustomSplash> createState() => _CustomSplashState();
}

class _CustomSplashState extends State<CustomSplash> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MainAfterSplash())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(CustomColors.splashColor),
      body: Center(
        child: Image(image: AssetImage(CustomImages.logo)),
      ),
    );
  }
}
