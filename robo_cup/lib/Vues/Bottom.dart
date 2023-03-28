import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:robo_cup/Vues/comp%C3%A9tition/addCompetition.dart';
import 'package:robo_cup/Vues/comp%C3%A9tition/displayCompetition.dart';

class BottomPage extends StatefulWidget {
  const BottomPage({Key? key}) : super(key: key);

  @override
  State<BottomPage> createState() => _BottomPageState();
}

class _BottomPageState extends State<BottomPage> {
  static List<Widget> pages = [];

  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    pages = <Widget>[displayCompetition(), AddCompetition()];
    return Scaffold(
      body: pages.elementAt(currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
              label: 'listt',
              icon: currentIndex == 1
                  ? IconButton(
                      icon: SvgPicture.asset(
                        "assets/images/activeHome.svg",
                        height: 35,
                        width: 35,
                      ),
                      onPressed: null,
                    )
                  : IconButton(
                      icon: SvgPicture.asset(
                        "assets/images/disableHome.svg",
                        height: 35,
                        width: 35,
                      ),
                      onPressed: null,
                    )),
          BottomNavigationBarItem(
              label: 'chat',
              icon: currentIndex == 2
                  ? IconButton(
                      icon: Icon(
                        Icons.add_box,
                        color: Colors.amberAccent,
                      ),
                      onPressed: null,
                    )
                  : IconButton(
                      icon: Icon(
                        Icons.add_box,
                        color: Colors.grey,
                      ),
                      onPressed: null)),
          BottomNavigationBarItem(
              label: 'accout',
              icon: currentIndex == 3
                  ? IconButton(
                      icon: SvgPicture.asset(
                        "assets/images/activeProfile.svg",
                        height: 40,
                        width: 40,
                      ),
                      onPressed: null,
                    )
                  : IconButton(
                      icon: SvgPicture.asset(
                        "assets/images/disabledProfile.svg",
                        height: 40,
                        width: 40,
                      ),
                      onPressed: null,
                    )),
        ],
      ),
    );
  }
}
