import 'package:flutter/material.dart';
import 'package:hackathonapp/consts/color.dart';
import 'package:hackathonapp/consts/img.dart';
import 'package:hackathonapp/consts/text.dart';
import 'package:hackathonapp/pages/loginPage.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 12.0, right: 12, top: 36, bottom: 12),
          child: Container(
            alignment: Alignment.topLeft,
            height: MediaQuery.of(context).size.height * .31,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        child: Image(
                          image: AssetImage(CustomImages.homeavatar),
                          height: 100,
                          width: 100,
                        ),
                        radius: 20,
                      ),
                      //   children: [
                      Column(
                        children: [
                          Text(
                            CustomText.myName,
                            style: TextStyle(color: Colors.black, fontSize: 30),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.cancel_outlined,
                        color: Colors.black,
                        size: 25,
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {},
                          label: Text(
                            CustomText.edit,
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                          icon: Icon(Icons.edit),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Color(CustomColors.splashColor),
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {},
                          label: Text(
                            CustomText.settings,
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                          icon: Icon(Icons.settings),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Color(CustomColors.splashColor),
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                    label: Text(
                      CustomText.logout,
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    icon: Icon(Icons.logout_outlined),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Color(CustomColors.splashColor),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
