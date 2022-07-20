// import 'package:flutter/material.dart';
// import 'package:hackathonapp/consts/color.dart';
// import 'package:hackathonapp/consts/img.dart';
// import 'package:hackathonapp/consts/text.dart';
// import 'package:hackathonapp/functions/funcs.dart';
// import 'package:hackathonapp/pages/payment.dart';

// class Cart extends StatefulWidget {
//   const Cart({Key? key}) : super(key: key);

//   @override
//   State<Cart> createState() => _CartState();
// }

// class _CartState extends State<Cart> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Column(children: [
//       Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: SafeArea(
//             child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Row(
//               children: [
//                 IconButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     icon: Icon(Icons.arrow_back)),
//                 Text(
//                   CustomText.cart,
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
//                 ),
//               ],
//             ),
//             Row(
//               children: [
//                 IconButton(
//                   onPressed: () {},
//                   icon: Icon(Icons.search),
//                 ),
//                 CircleAvatar(
//                   child: Image(image: AssetImage(CustomImages.homeavatar)),
//                 )
//               ],
//             )
//           ],
//         )),
//       ),
//       Expanded(
//         child: SingleChildScrollView(
//             child: Column(
//           children: [
//             cartTile(CustomImages.shirt, CustomText.shirt, CustomText.sandy,
//                 CustomText.twnty5),

//             // cartTile(CustomImages.shirt, CustomText.shirt, CustomText.sandy,
//             //     CustomText.twnty5),
//             // cartTile(CustomImages.shirt, CustomText.shirt, CustomText.sandy,
//             //     CustomText.twnty5),
//             // cartTile(CustomImages.shirt, CustomText.shirt, CustomText.sandy,
//             //     CustomText.twnty5),
//             // cartTile(CustomImages.shirt, CustomText.shirt, CustomText.sandy,
//             //     CustomText.twnty5),
//             // cartTile(CustomImages.shirt, CustomText.shirt, CustomText.sandy,
//             //     CustomText.twnty5),
//             // cartTile(CustomImages.shirt, CustomText.shirt, CustomText.sandy,
//             //     CustomText.twnty5),
//             // cartTile(CustomImages.shirt, CustomText.shirt, CustomText.sandy,
//             //     CustomText.twnty5),
//             // cartTile(CustomImages.shirt, CustomText.shirt, CustomText.sandy,
//             //     CustomText.twnty5),
//             // cartTile(CustomImages.shirt, CustomText.shirt, CustomText.sandy,
//             //     CustomText.twnty5),
//             // cartTile(CustomImages.shirt, CustomText.shirt, CustomText.sandy,
//             //     CustomText.twnty5),
//             // cartTile(CustomImages.shirt, CustomText.shirt, CustomText.sandy,
//             //     CustomText.twnty5),
//           ],
//         )),
//       ),
//       Padding(
//         padding: const EdgeInsets.only(left: 10.0),
//         child: Row(
//           children: [
//             Text(
//               CustomText.total,
//               style: TextStyle(color: Colors.grey, fontSize: 20),
//             ),
//             Text(
//               CustomText.twnty5,
//               style: TextStyle(
//                   color: Color(
//                     CustomColors.splashColor,
//                   ),
//                   fontSize: 24),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 130.0),
//               child: SizedBox(
//                 width: MediaQuery.of(context).size.width * .3,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => const Payment()),
//                     );
//                   },
//                   child: Text(CustomText.paynow),
//                   style: ButtonStyle(
//                       shadowColor: MaterialStateProperty.all(Colors.grey),
//                       backgroundColor: MaterialStateProperty.all(
//                           Color(CustomColors.splashColor))),
//                 ),
//               ),
//             )
//           ],
//         ),
//       )
//     ]));
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hackathonapp/consts/color.dart';
import 'package:hackathonapp/consts/img.dart';
import 'package:hackathonapp/consts/text.dart';
import 'package:hackathonapp/functions/funcs.dart';
import 'package:hackathonapp/pages/payment.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: SafeArea(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back)),
                Text(
                  CustomText.cart,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search),
                ),
                CircleAvatar(
                  child: Image(image: AssetImage(CustomImages.homeavatar)),
                )
              ],
            )
          ],
        )),
      ),
      Expanded(
        child: FutureBuilder<QuerySnapshot>(
          future: addToCart.get(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> abc =
                    document.data()! as Map<String, dynamic>;
                return ListTile(
                  title: Text(abc['Product name']),
                  subtitle: Text(abc['Product price']),
                );
              }).toList());
            } else {
              return Center(child: CircularProgressIndicator( color: Color(CustomColors.splashColor),));
            }
          },
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Row(
          children: [
            Text(
              CustomText.total,
              style: TextStyle(color: Colors.grey, fontSize: 20),
            ),
            Text(
              CustomText.twnty5,
              style: TextStyle(
                  color: Color(
                    CustomColors.splashColor,
                  ),
                  fontSize: 24),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 130.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .3,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Payment()),
                    );
                  },
                  child: Text(CustomText.paynow),
                  style: ButtonStyle(
                      shadowColor: MaterialStateProperty.all(Colors.grey),
                      backgroundColor: MaterialStateProperty.all(
                          Color(CustomColors.splashColor))),
                ),
              ),
            )
          ],
        ),
      )
    ]));
  }
}
