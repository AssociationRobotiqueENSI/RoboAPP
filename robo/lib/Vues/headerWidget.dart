import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class headerWidget extends StatelessWidget {
  const headerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color c1 = Theme.of(context).primaryColor;

    return Stack(
      children: [
        SvgPicture.asset(
          "assets/images/header.svg",
          alignment: Alignment.topCenter,
          width: MediaQuery.of(context).size.width,
        ),
        Positioned(
          top: Get.height / 12,
          left: Get.width / 4.5,
          child: Row(children: [
            Image.asset("assets/images/logo2.png", width: Get.width / 4),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "RoboCup",
                  style: GoogleFonts.playfairDisplay(
                    textStyle: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
                Text(
                  "ENSI",
                  style: GoogleFonts.playfairDisplay(
                    textStyle: TextStyle(color: c1, fontSize: 30),
                  ),
                )
              ],
            )
          ]),
        ),
      ],
    );
  }
}
