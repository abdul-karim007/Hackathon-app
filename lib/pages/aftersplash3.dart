import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hackathonapp/consts/color.dart';
import 'package:hackathonapp/consts/img.dart';
import 'package:hackathonapp/consts/text.dart';
import 'package:hackathonapp/functions/funcs.dart';
import 'package:hackathonapp/pages/loginPage.dart';

class AfterSplash3 extends StatelessWidget {
  const AfterSplash3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image(
            fit: BoxFit.cover,
            image: AssetImage(CustomImages.aftersplash3),
            width: MediaQuery.of(context).size.width,
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * .03,
            bottom: MediaQuery.of(context).size.height * .18,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  CustomText.text15,
                  style: TextStyle(
                      fontFamily: CustomText.abril,
                      fontSize: 40,
                      color: Colors.white),
                ),
                Text(
                  CustomText.text2,
                  style: TextStyle(
                      color: Color(CustomColors.splashColor),
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
                Text(
                  CustomText.text3,
                  style: TextStyle(
                      fontFamily: CustomText.abril,
                      fontSize: 40,
                      color: Colors.white),
                ),
                Row(
                  children: [
                    Text(
                      CustomText.text12,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text(
                        CustomText.text13,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ],
                ),
                Text(
                  CustomText.text14,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
          customGFbutton(CustomText.text7, context)
        ],
      ),
    );
  }
}
