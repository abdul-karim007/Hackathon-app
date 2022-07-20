import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hackathonapp/consts/color.dart';
import 'package:hackathonapp/consts/text.dart';
import 'package:hackathonapp/functions/funcs.dart';
import 'package:hackathonapp/pages/specifyMaterial.dart';

class Measurement extends StatefulWidget {
  const Measurement({Key? key}) : super(key: key);

  @override
  State<Measurement> createState() => _MeasurementState();
}

class _MeasurementState extends State<Measurement> {
  String dropdownvalue = '1';

  var items = [
    '1',
    '2',
    '3',
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  CustomText.waist,
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  CustomText.length,
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  CustomText.breadth,
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                alignment: Alignment.center,
                width: 50,
                height: 20,
                child: Text(
                  CustomText.forty3,
                  style: TextStyle(fontSize: 16),
                ),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(5)),
              ),
              Container(
                alignment: Alignment.center,
                width: 50,
                height: 20,
                child: Text(
                  CustomText.forty3,
                  style: TextStyle(fontSize: 16),
                ),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(5)),
              ),
              Container(
                alignment: Alignment.center,
                width: 50,
                height: 20,
                child: Text(
                  CustomText.forty3,
                  style: TextStyle(fontSize: 16),
                ),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(5)),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  CustomText.textColor,
                  style: TextStyle(fontSize: 16),
                ),
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
                Container(
                  alignment: Alignment.center,
                  color: Colors.grey[200],
                  width: 75,
                  child: DropdownButton(
                    value: dropdownvalue,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, bottom: 15),
            child: Text(
              CustomText.doYou,
              style: TextStyle(fontSize: 16),
            ),
          ),
          Row(
            children: [
              loginButton(CustomText.yes, context, () {}, .2, .05),
              TextButton(
                  onPressed: () {
                    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const SpecifyMaterial()),
  );
                  },
                  child: Text(
                    CustomText.no,
                    style: TextStyle(color: Colors.black),
                  ))
            ],
          ),
          Row(
            children: [
              Text(
                CustomText.total,
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                CustomText.twnty5,
                style: TextStyle(
                    color: Color(
                      CustomColors.splashColor,
                    ),
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
            ],
          )
        ],
      ),
    ]);
  }
}
