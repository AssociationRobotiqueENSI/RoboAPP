import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:robo_cup/Controller/CompetitonController.dart';
import 'package:robo_cup/Vues/comp%C3%A9tition/addCompetition.dart';
import 'package:robo_cup/Vues/headerWidget.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:robo_cup/models/Competition.dart';
import 'package:robo_cup/models/Competition.dart';

class displayCompetition extends StatefulWidget {
  const displayCompetition({Key? key}) : super(key: key);

  @override
  State<displayCompetition> createState() => _displayCompetitionState();
}

class _displayCompetitionState extends State<displayCompetition> {
  final ScrollController _gridViewController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: Get.height / 3,
              child: headerWidget(),
            ),
            SizedBox(
              height: 15,
            ),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Competitions",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              letterSpacing: 2)),
                      SizedBox(
                        height: 20,
                      ),
                      SingleChildScrollView(
                          child: Container(
                        margin: EdgeInsets.only(bottom: 50),
                        height: Get.height * 0.67,
                        child: _buildBody(context),
                      ))
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return GridView(
      controller: _gridViewController,
      children: snapshot.map((comp) => competitionItem(context, comp)).toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          mainAxisExtent: 220,
          maxCrossAxisExtent: 220,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15),
    );
  }

  Widget _buildBody(BuildContext context) {
    // TODO: get actual snapshot from Cloud Firestore
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('Competition').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return _buildList(context, snapshot.data!.documents);
      },
    );
  }

  Widget competitionItem(BuildContext context, data) {
    final compet = competition.fromMap(data);

    return Stack(
      children: [
        Container(
          key: ValueKey(compet.nom),
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            /*image: DecorationImage(
              image: AssetImage("${comp.image}"),
              fit: BoxFit.cover,
            ),*/
          ),
          child: Container(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.only(left: 20),
              height: Get.height / 6,
              width: Get.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(colors: [
                    Colors.black.withOpacity(0.3),
                    Colors.black.withOpacity(0.8),
                  ], end: Alignment.bottomCenter, begin: Alignment.topRight)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: Get.width,
                    child: Text(
                      "${compet.nom}",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "${compet.tache![0].nom}",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 11,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
            right: 0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                    icon: Icon(
                      FontAwesomeIcons.edit,
                      size: 20,
                      color: Colors.green,
                    ),
                    onPressed: () {
                      //Get.to(() => dealFormPage(isEdit: true, deal: e));
                    }),
                IconButton(
                    onPressed: () {
                      Get.defaultDialog(
                          title: "Deal",
                          textConfirm: 'Yes',
                          textCancel: 'no',
                          onConfirm: null,
                          content: Center(
                            child: Text(
                                "Are you sure that you want to remove the offer?"),
                          ));
                    },
                    icon: Icon(FontAwesomeIcons.solidTrashAlt,
                        size: 20, color: Colors.red)),
              ],
            )),
      ],
    );
  }
}
