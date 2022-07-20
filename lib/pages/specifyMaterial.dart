import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hackathonapp/consts/color.dart';
import 'package:hackathonapp/consts/text.dart';
import 'package:hackathonapp/functions/funcs.dart';
import 'package:hackathonapp/pages/cart.dart';
import 'package:hackathonapp/pages/payment.dart';

class SpecifyMaterial extends StatefulWidget {
  const SpecifyMaterial({Key? key}) : super(key: key);

  @override
  State<SpecifyMaterial> createState() => _SpeciState();
}

class _SpeciState extends State<SpecifyMaterial> {
  final List materials = [
    "Lace",
    "Ankara",
    "Guinea",
    "Linen",
    "Silk",
    "Wool",
    "Cotton"
  ];
  late int selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back)),
                  Text(
                    CustomText.specifyMaterial,
                    style: TextStyle(fontSize: 25),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(35, 5, 35, 5),
                      child: Column(
                        children: [
                          Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 5, 35, 5),
                                child: Text(
                                  CustomText.material,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              )),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.47,
                            child: ListView.builder(
                                itemCount: materials.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.065,
                                    child: ListTile(
                                        title: Text(
                                      "${materials[index]}",
                                      style: TextStyle(fontSize: 16),
                                    )),
                                  );
                                }),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 5, 35, 5),
                            child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  CustomText.enterColor,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 5, 35, 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.black,
                                  radius: 15,
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.red,
                                  radius: 15,
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.deepPurple,
                                  radius: 15,
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.blue,
                                  radius: 15,
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.pink,
                                  radius: 15,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 5, 35, 5),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                "HOW MANY YARDS?",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 250,
                            height: 250,
                            child: TextFormField(
                              decoration: InputDecoration(
                                filled: true,
                                border: InputBorder.none,
                              ),
                              initialValue: "5",
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 100),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * .07,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Cart()),
                      );
                    },
                    child: Text(CustomText.done),
                    style: ButtonStyle(
                        shadowColor: MaterialStateProperty.all(Colors.grey),
                        backgroundColor: MaterialStateProperty.all(
                            Color(CustomColors.splashColor))),
                  ),
                ))
          ]),
    );
  }
}
