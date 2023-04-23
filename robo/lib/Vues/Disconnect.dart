import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../QrCode/qrCode1.dart';
import '../../Vues/headerWidget.dart';
import '../../Vues/login.dart';
import 'package:get/get.dart';

class disconnect extends StatelessWidget {
  disconnect({Key? key}) : super(key: key);
  final FirebaseAuth _auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    Color color = Theme
        .of(context)
        .primaryColor;
    return Scaffold(
      body: Center(child: Column(children: [
        Container(
          height: Get.height / 3,
          child: headerWidget(),
        ),
        SizedBox(
          height: 15,
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
      ),);
  }
}
