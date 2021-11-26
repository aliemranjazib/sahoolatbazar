// IMAGE LINK : https://unsplash.com/photos/bOBM8CB4ZC4

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sahoolar_bazar/components/progressbar.dart';
import 'package:sahoolar_bazar/constants/constants.dart';
import 'package:sahoolar_bazar/userpages/auth/logi_page.dart';
import 'package:sahoolar_bazar/userpages/homepage.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var globalKey = GlobalKey<FormState>();
  TextEditingController uC = TextEditingController();
  TextEditingController phoneC = TextEditingController();
  TextEditingController cityC = TextEditingController();
  TextEditingController areaC = TextEditingController();
  TextEditingController addressC = TextEditingController();

  saveform(BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) {
          return ProgressBar(
            title: 'saving please wait...',
          );
        });
    var u = auth.currentUser.uid;

    CollectionReference db = FirebaseFirestore.instance.collection('profile');
    db.add({
      'uid': u.toString(),
      'name': uC.text,
      'phone': phoneC.text,
      'city': cityC.text,
      'area': areaC.text,
      'address': addressC.text
    });

    if (u != null) {
      Navigator.push(context, MaterialPageRoute(builder: (c) => HomePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Add Address",
          style: TextStyle(color: Colors.black),
        ),
        leading:
            IconButton(onPressed: () {}, icon: Icon(Icons.navigate_before)),
      ),
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            child: Stack(
              children: [
                SizedBox(
                  height: size.height,
                  child: Container(
                    color: Colors.white,
                  ),
                  // child: Image.asset(
                  //   'asset/ws.jpg',
                  //   fit: BoxFit.fitHeight,
                  // ),
                ),
                Center(
                  child: Column(
                    children: [
                      Expanded(
                        flex: 7,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: SizedBox(
                            width: size.width * .9,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: size.width * .15,
                                    bottom: size.width * .1,
                                  ),
                                  child: Text(
                                    'Add Shipping Adress',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black.withOpacity(.8),
                                    ),
                                  ),
                                ),
                                component(
                                  Icons.account_circle_outlined,
                                  'Full name...',
                                  false,
                                  false,
                                  uC,
                                ),
                                component(
                                  Icons.phone_android,
                                  'Enter Phone...',
                                  false,
                                  true,
                                  phoneC,
                                ),
                                component(
                                  Icons.location_city,
                                  'Enter City...',
                                  false,
                                  true,
                                  cityC,
                                ),
                                component(
                                  Icons.map,
                                  'Enter Area...',
                                  false,
                                  true,
                                  areaC,
                                ),
                                component(
                                  Icons.location_city,
                                  'Enter Address...',
                                  false,
                                  true,
                                  addressC,
                                ),
                                SizedBox(height: size.width * .3),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () {
                                    HapticFeedback.lightImpact();
                                    saveform(context);
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      bottom: size.width * .05,
                                    ),
                                    height: size.width / 8,
                                    width: size.width / 1.25,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(.1),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      'SAVE',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget component(
    IconData icon,
    String hintText,
    bool isPassword,
    bool isEmail,
    TextEditingController controller,
  ) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.width / 8,
      width: size.width / 1.25,
      alignment: Alignment.center,
      padding: EdgeInsets.only(right: size.width / 30),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        controller: controller,
        style: TextStyle(
          color: Colors.black.withOpacity(.9),
        ),
        onSubmitted: (String v) {
          controller.text = v;
        },
        obscureText: isPassword,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.black.withOpacity(.8),
          ),
          border: InputBorder.none,
          hintMaxLines: 1,
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14,
            color: Colors.black.withOpacity(.5),
          ),
        ),
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
    BuildContext context,
    Widget child,
    AxisDirection axisDirection,
  ) {
    return child;
  }
}
