import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hackathonapp/consts/color.dart';
import 'package:hackathonapp/consts/img.dart';
import 'package:hackathonapp/consts/text.dart';
import 'package:hackathonapp/functions/funcs.dart';
import 'package:hackathonapp/pages/btmNavigation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hackathonapp/pages/signup.dart';

class Login extends StatelessWidget {
  TextEditingController emailcont = TextEditingController();
  TextEditingController passcont = TextEditingController();
  Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Image(
                    image: AssetImage(CustomImages.loginLogo),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .2),
                  child: Container(
                    height: MediaQuery.of(context).size.height * .5,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(top: 25.0),
                            child: customTxtFld(CustomText.yourEmail, context,
                                Icons.person_outlined, emailcont)),
                        Padding(
                            padding:
                                const EdgeInsets.only(top: 15.0, bottom: 15),
                            child: customTxtFld(CustomText.yourPassword,
                                context, Icons.lock_outlined, passcont)),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .4,
                          height: MediaQuery.of(context).size.height * .05,
                          child: ElevatedButton(
                            onPressed: () async {
                              try {
                                UserCredential userCredential =
                                    await FirebaseAuth.instance
                                        .signInWithEmailAndPassword(
                                            email: emailcont.text,
                                            password: passcont.text);
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CustomBtmNav()),
                                );
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'user-not-found') {
                                  customDia(
                                      context, CustomText.noUser);
                                } else if (e.code == 'wrong-password') {
                                  customDia(
                                      context, CustomText.wrongPass);
                                }
                              }
                            },
                            child: Text(CustomText.login),
                            style: ButtonStyle(
                                shadowColor:
                                    MaterialStateProperty.all(Colors.grey),
                                backgroundColor: MaterialStateProperty.all(
                                    Color(CustomColors.splashColor))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            CustomText.or,
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .6,
                          height: MediaQuery.of(context).size.height * .05,
                          child: ElevatedButton(
                            onPressed: () {
                              signInWithGoogle(context);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image(
                                  image: AssetImage(CustomImages.google),
                                  height: 30,
                                ),
                                Text(CustomText.loginGoogle),
                              ],
                            ),
                            style: ButtonStyle(
                                shadowColor:
                                    MaterialStateProperty.all(Colors.grey),
                                backgroundColor: MaterialStateProperty.all(
                                    Color(CustomColors.splashColor))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Signup()),
                                );
                              },
                              child: Text(
                                CustomText.create,
                                style: TextStyle(color: Colors.black),
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              ]),
        ));
  }

  Future<UserCredential> signInWithGoogle(context) async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CustomBtmNav()),
                                );
    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
