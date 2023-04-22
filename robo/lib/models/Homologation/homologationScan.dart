import 'package:flutter/material.dart';

import '../../QrCode/qrCode1.dart';
class homologationScan extends StatelessWidget {
  homologationScan({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Color color = Theme
        .of(context)
        .primaryColor;
    return Scaffold(
      body: Center(child: ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>First("homologation")));
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
    ),);
  }
}
