import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hackathonapp/consts/img.dart';
import 'package:hackathonapp/consts/text.dart';

class Instagram extends StatelessWidget {
  const Instagram({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Image(
          image: AssetImage(CustomImages.instaBg),
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
        ),
        Positioned(
          child: Image(
            image: AssetImage(CustomImages.instapic),
          ),
          right: 0,
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.height * .1,
          left: MediaQuery.of(context).size.width * .07,
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * .75,
                    child: GFButton(
                      icon: Icon(
                        Icons.login,
                        color: Colors.white,
                      ),
                      color: Colors.white,
                      textColor: Colors.white,
                      onPressed: () {},
                      text: CustomText.text16,
                      type: GFButtonType.outline2x,
                    ),
                  ),
                ),
                Text(
                  CustomText.text17,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Row(
                  children: [
                    Text(
                      CustomText.text18,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          decoration: TextDecoration.underline),
                    ),
                    Text(
                      CustomText.text19,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Text(
                      CustomText.text20,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          decoration: TextDecoration.underline),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
