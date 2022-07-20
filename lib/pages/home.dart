import 'package:flutter/material.dart';
import 'package:hackathonapp/consts/color.dart';
import 'package:hackathonapp/consts/img.dart';
import 'package:hackathonapp/consts/text.dart';
import 'package:hackathonapp/functions/funcs.dart';
import 'package:hackathonapp/functions/search.dart';
import 'package:hackathonapp/pages/cart.dart';
import 'package:hackathonapp/pages/prodDetail.dart';
import 'package:hackathonapp/pages/profile.dart';
import 'package:hackathonapp/pages/settings.dart';
import 'package:hackathonapp/pages/shop.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
 
  int selected = 0;
  List pages = <Widget>[Home(), Shop(), Settings(), Cart()];

  

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(CustomColors.color1),
          title: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height * .12,
                    width: MediaQuery.of(context).size.width * .8,
                    child: customSearch()
                    
                    ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Profile()),
                    );
                  },
                  child: CircleAvatar(
                    child: Image(image: AssetImage(CustomImages.homeavatar)),
                  ),
                )
              ],
            ),
          ),
          bottom: TabBar(
            tabs: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  CustomText.women,
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  CustomText.men,
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  CustomText.children,
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              )
            ],
            indicatorColor: Colors.red,
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  homeCard(context, CustomText.sandy),
                  homeCard(context, CustomText.sandy)
                ],
              ),
            ),
            Column(
              children: [
                Card(child: Text(CustomText.men)),
              ],
            ),
            Column(
              children: [
                Card(child: Text(CustomText.children)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      selected = index;
    });
  }
}
