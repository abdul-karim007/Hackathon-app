import 'package:flutter/material.dart';
import 'package:hackathonapp/consts/color.dart';
import 'package:hackathonapp/consts/img.dart';
import 'package:hackathonapp/consts/text.dart';
import 'package:hackathonapp/functions/funcs.dart';
import 'package:hackathonapp/pages/loginInstagram.dart';
import 'package:intro_slider/intro_slider.dart';

class onboardingView extends StatelessWidget {
  const onboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      colorActiveDot: Colors.purple,
      colorDot: Colors.white,
      showNextBtn: false,
      showSkipBtn: false,
      showDoneBtn: false,
      hideStatusBar: true,
      showPrevBtn: false,
      listCustomTabs: [
        Title(
            color: Colors.white,
            child: onBoarding(
                context,
                CustomImages.aftersplash1,
                CustomText.text1,
                CustomText.text2,
                CustomText.text3,
                CustomText.text4,
                CustomText.text5,
                CustomText.text6,
                CustomText.text7)),
        Title(
            color: Colors.white,
            child: onBoarding(
                context,
                CustomImages.aftersplash2,
                CustomText.text8,
                CustomText.text2,
                CustomText.text3,
                CustomText.text9,
                CustomText.text10,
                CustomText.text11,
                CustomText.text7)),
        
        Title(
            color: Colors.white,
            child: onBoarding(
                context,
                CustomImages.aftersplash3,
                CustomText.text15,
                CustomText.text2,
                CustomText.text3,
                CustomText.text12,
                CustomText.text13,
                CustomText.text14,
                CustomText.text7)),
                Title(color: Colors.white, child: Instagram())
      ],
    );
  }
}
