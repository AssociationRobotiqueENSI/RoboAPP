import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:robo/Vues/Tache/addTache.dart';
import 'package:robo/models/Competition.dart';

import '../headerWidget.dart';

class AddCompetition extends StatelessWidget {
  AddCompetition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color c1 = Theme.of(context).primaryColor;

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
                "Add a competition",
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

  final nameController = TextEditingController();
  Container buildBody(color, context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 10, 20, 5),
      child: Column(children: [
        Form(
          child: Column(
            children: [
              /****************Name Field**************************** */
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Name",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Oxygen',
                          fontSize: 25)),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 48,
                    child: TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: color, width: 1.0),
                          ),
                          hintText: 'Name',
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey.shade400, width: 1.0))),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20.0),

              /**************************Task************************ */

              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const addTache()),
                  );
                },
                child: Row(children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add_circle,
                      color: Color.fromARGB(255, 17, 17, 20),
                      size: 20.0,
                    ),
                  ),
                  Text('Add a task',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Oxygen',
                          fontSize: 15)),
                ]),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [],
              ),
              SizedBox(height: 10.0),
              SizedBox(height: 20.0),

              /************ buttoon***************** */
              Container(
                width: Get.width,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    createCompetition(name: nameController.text);
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
        )
      ]),
    );
  }

  Future createCompetition({required String name}) async {
    final docComp =
        FirebaseFirestore.instance.collection("competitions").doc(name);
    final competition = Competition(name, []);

    final json = competition.toJson();
    await docComp.set(json);
    Get.defaultDialog(
      title: "GeeksforGeeks",
      middleText: "Hello world!",
      backgroundColor: Colors.green,
      titleStyle: TextStyle(color: Colors.white),
      middleTextStyle: TextStyle(color: Colors.white),
    );
    nameController.clear();
  }
}
