import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hackathonapp/consts/text.dart';

class customSearch extends StatefulWidget {
  const customSearch({Key? key}) : super(key: key);

  @override
  State<customSearch> createState() => _customSearchState();
}

class _customSearchState extends State<customSearch> {
  var clothes = [
    CustomText.shirrt,
    CustomText.tshirt,
    CustomText.hshirt,
    CustomText.hshirt,
    CustomText.shirrt
  ];
  @override
  Widget build(BuildContext context) {
    return GFSearchBar(
        searchBoxInputDecoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            prefixIconColor: Colors.grey,
            hintText: CustomText.search,
            hintStyle: TextStyle(color: Colors.grey),
            suffixIcon: Icon(Icons.cancel_outlined),
            suffixIconColor: Colors.grey,
            fillColor: Colors.grey[200],
            filled: true,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(90))),
        searchList: clothes,
        searchQueryBuilder: (query, clothes) => clothes.where((item) {
              return item!
                  .toString()
                  .toLowerCase()
                  .contains(query.toLowerCase());
            }).toList(),
        overlaySearchListItemBuilder: (dynamic item) => Container(
              padding: const EdgeInsets.all(4),
              child: Text(
                item,
                style: const TextStyle(fontSize: 18),
              ),
            ),
        onItemSelected: (dynamic item) {
          setState(() {
            print('$item');
          });
        });
  }
}
