import 'package:flutter/material.dart';
import 'package:hackathonapp/pages/aftersplash1.dart';
import 'package:hackathonapp/pages/aftersplash2.dart';
import 'package:hackathonapp/pages/aftersplash3.dart';
import 'package:hackathonapp/pages/loginInstagram.dart';

class MainAfterSplash extends StatelessWidget {
  const MainAfterSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        Center(
          child: AfterSplash(),
        ),
        Center(
          child: AfterSplash2(),
        ),
        Center(
          child: AfterSplash3(),
        ),
        Center(
          child: Instagram(),
        )
      ],
    );
  }
}
