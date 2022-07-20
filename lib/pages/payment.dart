import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hackathonapp/consts/color.dart';
import 'package:hackathonapp/consts/text.dart';
import 'package:hackathonapp/pages/btmNavigation.dart';

class Payment extends StatelessWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.green.withOpacity(.5),
                ),
                Positioned(
                  child: Icon(
                    Icons.check,
                    color: Colors.green,
                    size: 40,
                  ),
                  left: 0,
                  right: 0,
                  top: 0,
                  bottom: 0,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text(
                CustomText.payment,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
            ),
            Text(
              CustomText.paymentSent,
              style: TextStyle(fontSize: 22),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 28.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .8,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CustomBtmNav()),
                    );
                  },
                  child: Text(CustomText.contShop),
                  style: ButtonStyle(
                      shadowColor: MaterialStateProperty.all(Colors.grey),
                      backgroundColor: MaterialStateProperty.all(
                          Color(CustomColors.splashColor))),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
