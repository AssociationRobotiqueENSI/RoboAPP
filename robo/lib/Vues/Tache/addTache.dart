import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:robo/Vues/headerWidget.dart';

class addTache extends StatelessWidget {
  const addTache({Key? key}) : super(key: key);

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
                "Add a task",
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Task",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Oxygen',
                                    fontSize: 30)),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 35,
                              width: 190,
                              child: TextFormField(
                                obscureText: false,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: color, width: 1.0),
                                    ),
                                    hintText: 'Name',
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade400,
                                            width: 1.0))),
                              ),
                            ),
                            Container(
                              height: 35,
                              width: 100,
                              child: TextFormField(
                                obscureText: false,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: color, width: 1.0),
                                    ),
                                    hintText: 'Note Max',
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade400,
                                            width: 1.0))),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        SizedBox(height: 20.0),

                        /************ buttoon***************** */

                        Container(
                          width: 200,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () {},
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
