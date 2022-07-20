import 'package:flutter/material.dart';
import 'package:hackathonapp/consts/text.dart';

info() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          CustomText.material,
          style: TextStyle(fontSize: 20),
        ),
      ),
      Text(
        CustomText.info1,
        style: TextStyle(fontSize: 18, color: Colors.grey),
      ),
      Text(
        CustomText.washingIns,
        style: TextStyle(fontSize: 20),
      )
    ],
  );
}
