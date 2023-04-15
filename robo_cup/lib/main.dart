import 'package:flutter/material.dart';
import 'package:robo_cup/Vues/Bottom.dart';
import 'package:robo_cup/Vues/comp%C3%A9tition/displayCompetition.dart';
import 'package:robo_cup/Vues/login.dart';
import 'package:hexcolor/hexcolor.dart';

void main() {
  runApp(roboCup());
}

class roboCup extends StatefulWidget {
  const roboCup({Key? key}) : super(key: key);

  @override
  State<roboCup> createState() => _roboCupState();
}

class _roboCupState extends State<roboCup> {
  final Color _primaryColor = HexColor('#E2AC0D');

  final Color _accentColor = HexColor("#000000");
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primaryColor: _primaryColor,
            accentColor: _accentColor,
            fontFamily: 'Raleway'),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: BottomPage(),
        ));
  }
}
