import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:robo/Vues/headerWidget.dart';

import '../../models/Team.dart';
import 'displayTeam.dart';

class addTeams extends StatelessWidget {
  const addTeams({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color c1 = Theme.of(context).primaryColor;
    final CollectionReference teams =
    FirebaseFirestore.instance.collection('teams');

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
              Container(
                child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Text(
                    "Add a team",
                    style: GoogleFonts.playfairDisplay(
                        textStyle:
                        TextStyle(fontSize: 32, fontWeight: FontWeight.w600)),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ]),
              ),
              SizedBox(
                height: 10,
              ),
              buildBody(c1, context),
            ],
          )),
    );
  }

  Container buildBody(color, context) {

    final CollectionReference teams =
    FirebaseFirestore.instance.collection('teams');
    final teamNameController = TextEditingController();
    final robotNameController = TextEditingController();
    final teamChefController = TextEditingController();
    final competitionTypeController = TextEditingController();
    final phoneNumberController = TextEditingController();
    return Container(
      margin: EdgeInsets.fromLTRB(20, 10, 20, 5),
      child: Column(
        children: [
          Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /****************Name Field**************************** */
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        TextField(
                          controller: teamNameController,
                          decoration: const InputDecoration(
                            labelText: 'Team Name',
                          ),
                        ),
                        TextField(
                          controller: robotNameController,
                          decoration: const InputDecoration(
                            labelText: 'Robot Name',
                          ),
                        ),
                        TextField(
                          controller: teamChefController,
                          decoration: const
                          InputDecoration(
                            labelText: 'Team Chef',
                          ),
                        ),
                        Row(children: [
                          Text("Competition:",
                              style: TextStyle(
                                  fontSize: 20)),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {

                                  competitionTypeController.text = competitionType.suiveur.toString();

                                },
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  minimumSize: MaterialStateProperty.all(Size(20, 20)),
                                  backgroundColor: MaterialStateProperty.all(color),
                                ),
                                child: Text('suiveur'),
                              ),
                              ElevatedButton(
                                onPressed: () {

                                  competitionTypeController.text = CompetitionType.toutTerrain.toString();

                                },
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  minimumSize: MaterialStateProperty.all(Size(20, 20)),
                                  backgroundColor: MaterialStateProperty.all(color),
                                ),
                                child: Text('Tout terrain'),
                              ),]
                        ),
                        SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {

                                competitionTypeController.text = competitionType.autonome.toString();

                              },
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all(Size(20, 20)),
                                backgroundColor: MaterialStateProperty.all(color),
                              ),

                              child: Text('autonome'),
                            ),
                            ElevatedButton(
                              onPressed: () {

                                competitionTypeController.text = CompetitionType.junior.toString();

                              },
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all(Size(20, 20)),
                                backgroundColor: MaterialStateProperty.all(color),
                              ),
                              child: Text('junior'),
                            ),
                          ],
                        ),

                        TextField(
                          controller: phoneNumberController,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            labelText: 'Phone Number',
                          ),

                        ),
                        SizedBox(height: 10.0),
                        SizedBox(height: 20.0),

                        /************ buttoon***************** */

                        Container(
                          width: 200,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () {
                              final teamName = teamNameController.text;
                              final robotName = robotNameController.text;
                              final teamChef = teamChefController.text;
                              final competitionType = competitionTypeController;
                              final phoneNumber = phoneNumberController.text;
                              teams.add(Team(
                                teamName: teamName,
                                robotName: robotName,
                                teamChef: teamChef,
                                CompetitionType: competitionType.text,
                                phoneNumber: phoneNumber,
                                homologation: "",
                                lunch: "",
                                arrive: "",
                              ).toMap());

                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TeamList()));
                            },
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              minimumSize:
                              MaterialStateProperty.all(Size(50, 50)),
                              backgroundColor: MaterialStateProperty.all(color),
                            ),
                            child: Text(
                              'Save',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal),
                            ),

                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}