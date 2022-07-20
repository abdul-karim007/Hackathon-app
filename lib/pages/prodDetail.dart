import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hackathonapp/consts/color.dart';
import 'package:hackathonapp/consts/img.dart';
import 'package:hackathonapp/consts/text.dart';
import 'package:hackathonapp/functions/funcs.dart';
import 'package:hackathonapp/functions/info.dart';
import 'package:hackathonapp/functions/msrmnt.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back)),
                  Container(
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.favorite_outline)),
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.share_sharp))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            CarouselSlider(
              items: [
                Image(
                  image: AssetImage(
                    CustomImages.lady1,
                  ),
                  height: MediaQuery.of(context).size.height * .3,
                ),
                Image(
                    image: AssetImage(CustomImages.lady1),
                    height: MediaQuery.of(context).size.height * .3),
                Image(
                    image: AssetImage(CustomImages.lady1),
                    height: MediaQuery.of(context).size.height * .3),
              ],
              options: CarouselOptions(
                height: 300,
                enlargeCenterPage: true,
                // autoPlay: true,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            ),
            Text(
              CustomText.descrip1,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8),
              child: Text(
                CustomText.twnty5,
                style: TextStyle(
                    color: Color(
                      CustomColors.splashColor,
                    ),
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              child: TabBar(
                unselectedLabelColor: Colors.grey,
                labelColor: Colors.black,
                indicatorColor: Color(CustomColors.splashColor),
                tabs: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      CustomText.info,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      CustomText.measurement,
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Stack(children: [
                TabBarView(
                  children: [info(), Measurement()],
                ),
                Positioned(
                    right: 20,
                    bottom: 20,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * .6,
                      height: MediaQuery.of(context).size.height * .05,
                      child: ElevatedButton(
                        onPressed: () {
                          addcart('Product added', CustomText.twnty5, context);
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => Cart()),
                          // );
                        },
                        child: Text(CustomText.addToBag),
                        style: ButtonStyle(
                            shadowColor: MaterialStateProperty.all(Colors.grey),
                            backgroundColor: MaterialStateProperty.all(
                                Color(CustomColors.splashColor))),
                      ),
                    ))
              ]),
            ),
          ]),
        ));
  }
}
