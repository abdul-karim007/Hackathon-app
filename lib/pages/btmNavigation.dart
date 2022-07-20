import 'package:flutter/material.dart';
import 'package:hackathonapp/consts/color.dart';
import 'package:hackathonapp/pages/cart.dart';
import 'package:hackathonapp/pages/home.dart';
import 'package:hackathonapp/pages/settings.dart';
import 'package:hackathonapp/pages/shop.dart';

class CustomBtmNav extends StatefulWidget {
  
  const CustomBtmNav({Key? key}) : super(key: key);

  @override
  State<CustomBtmNav> createState() => _CustomBtmNavState();
}

class _CustomBtmNavState extends State<CustomBtmNav> {
  int selected = 0;
  List pages = <Widget>[Home(), Shop(), Settings(), Cart()];
  void _onItemTapped(int index) {
    setState(() {
      selected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: pages.elementAt(selected),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 20,
        selectedIconTheme:
            IconThemeData(color: Color(CustomColors.splashColor)),
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                // color: Colors.grey,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
              ),
              label: ''),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              Icons.shop_outlined,
            ),
          )
        ],
        currentIndex: selected,
        onTap: _onItemTapped,
      ),
    );
  }
}
