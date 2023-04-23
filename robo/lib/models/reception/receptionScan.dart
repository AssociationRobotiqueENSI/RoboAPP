import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../QrCode/qrCode1.dart';
import '../../Vues/headerWidget.dart';
import '../../Vues/login.dart';
class receptionScan extends StatelessWidget {
  receptionScan({Key? key}) : super(key: key);
  final FirebaseAuth _auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    Color color = Theme
        .of(context)
        .primaryColor;
    return Center(child: Column(children: [
      Container(
        height: Get.height / 3,
        child: headerWidget(),
      ),
      SizedBox(
        height: 15,
      ),
      ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>First("reception")));
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          minimumSize: MaterialStateProperty.all(Size(50, 50)),
          backgroundColor: MaterialStateProperty.all(color),
        ),
        child: Text(
          'Scan',
          style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.normal),
        ),
      ),
      SizedBox(height: 10,),
      ElevatedButton(
        onPressed: () async{
          await _auth.signOut();
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => loginPage()));
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          minimumSize: MaterialStateProperty.all(Size(50, 50)),
          backgroundColor: MaterialStateProperty.all(color),
        ),
        child: Text(
          'Disconnect',
          style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.normal),
        ),
      ),
    ],)
    );
  }
}
