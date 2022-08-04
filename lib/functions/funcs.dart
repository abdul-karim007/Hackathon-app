import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:getwidget/getwidget.dart';
import 'package:hackathonapp/consts/color.dart';
import 'package:hackathonapp/consts/img.dart';
import 'package:hackathonapp/consts/text.dart';
import 'package:hackathonapp/pages/loginPage.dart';
import 'package:hackathonapp/pages/prodDetail.dart';
import 'package:like_button/like_button.dart';

customGFbutton(t1, context) {
  return Positioned(
    bottom: MediaQuery.of(context).size.height * .1,
    left: MediaQuery.of(context).size.width * .13,
    child: Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * .75,
        child: GFButton(
          color: Colors.white,
          textColor: Colors.white,
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Login()),
            );
          },
          text: t1,
          type: GFButtonType.outline2x,
        ),
      ),
    ),
  );
}

customTxtFld(textFieldText, context, icon1, txtcont) {
  return SizedBox(
      // width: MediaQuery.of(context).size.width * .8,
      child: TextField(
    controller: txtcont,
    decoration: InputDecoration(
        prefixIcon: Icon(icon1),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none),
        filled: true,
        hintStyle: TextStyle(color: Colors.grey),
        hintText: textFieldText,
        fillColor: Color(CustomColors.txtfieldColor)),
  ));
}

loginButton(loginText, ctx, f, i, j) {
  return SizedBox(
    width: MediaQuery.of(ctx).size.width * i,
    height: MediaQuery.of(ctx).size.height * j,
    child: ElevatedButton(
      onPressed: () {
        f;
      },
      child: Text(loginText),
      style: ButtonStyle(
          shadowColor: MaterialStateProperty.all(Colors.grey),
          backgroundColor:
              MaterialStateProperty.all(Color(CustomColors.splashColor))),
    ),
  );
}

cartTile(img, tTxt, sTxt, price) {
  return ListTile(
    leading: Image(
      image: AssetImage(img),
    ),
    title: Text(tTxt),
    subtitle: Text(sTxt),
    trailing: Column(
      children: [
        Icon(
          Icons.cancel_outlined,
          size: 15,
        ),
        Text(
          price,
          style:
              TextStyle(color: Color(CustomColors.splashColor), fontSize: 18),
        )
      ],
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
    ),
  );
}

homeCard(context, likeText) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Details()),
      );
    },
    child: Card(
      margin: EdgeInsets.all(15),
      color: Colors.white,
      shadowColor: Colors.grey[400],
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(CustomImages.homeavatar),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        CustomText.sandy,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        CustomText.tailor,
                        style: TextStyle(color: Colors.grey, fontSize: 17),
                      ),
                    ],
                  ),
                ]),
              ),
              Container(
                child: Row(
                  children: [
                    LikeButton(
                      size: 18,
                      likeCountPadding: const EdgeInsets.all(4.0),
                      // onTap: (bool isfavorite) async {
                      //   like('Product added to Likes');
                      //   likeit(isfavorite);
                      // },
                    ),
                    Text(
                      CustomText.twopoint,
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Text(
            CustomText.sandyText,
            style: TextStyle(fontSize: 18),
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image(
                    image: AssetImage(
                  CustomImages.lady1,
                )),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image(image: AssetImage(CustomImages.lady1_2)),
                  ),
                  Image(image: AssetImage(CustomImages.lady1_3)),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image(image: AssetImage(CustomImages.lady1_4)),
                  ),
                  Image(image: AssetImage(CustomImages.lady1_2)),
                ],
              )
            ],
          ),
          Row(
            children: [
              loginButton(CustomText.summer, context, () {}, .25, .04),
              Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child:
                      loginButton(CustomText.purple, context, () {}, .25, .04))
            ],
          )
        ],
      ),
    ),
  );
}

Future<void> customDia(BuildContext context, alertText) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert'),
          content: Text(alertText),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  
                },
                child: Text(
                  'Ok',
                  style: TextStyle(color: Color(CustomColors.splashColor)),
                ))
          ],
        );
      });
}

CollectionReference liked = FirebaseFirestore.instance.collection('Liked');

Future<void> like(text) {
  return liked
      .add({'liked': text})
      .then((value) => print("Added"))
      .catchError((error) => print("Failed to add: $error"));
}

likeit(bool isFavorite) {
  return Icon(
    Icons.favorite,
    color: Colors.red,
    size: 15,
  );
}

  CollectionReference addToCart =
      FirebaseFirestore.instance.collection('Add to Cart');

  Future<void> addcart(t1, t2, context) {
    return addToCart
        .add({
          'Product name': t1,
          'Product price': t2,
          
        })
        .then((value) => customDia(context, 'Added to Cart'))
        .catchError((error) => print("Failed to add user: $error"));
  }

onBoarding(context, img, t1, t2, t3, t4, t5, t6, t7){
 return Stack(
            children: [
              Image(
                fit: BoxFit.cover,
                image: AssetImage(img),
                width: MediaQuery.of(context).size.width,
              ),
              Positioned(
                left: MediaQuery.of(context).size.width * .03,
                bottom: MediaQuery.of(context).size.height * .18,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      t1,
                      style: TextStyle(
                          fontFamily: CustomText.abril,
                          fontSize: 40,
                          color: Colors.white),
                    ),
                    Text(
                      t2,
                      style: TextStyle(
                          color: Color(CustomColors.splashColor),
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                    Text(
                      t3,
                      style: TextStyle(
                          fontFamily: CustomText.abril,
                          fontSize: 40,
                          color: Colors.white),
                    ),
                    Row(
                      children: [
                        Text(
                          t4,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Text(
                            t5,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      t6,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
              ),
              customGFbutton(t7, context)
            ],
          );
}