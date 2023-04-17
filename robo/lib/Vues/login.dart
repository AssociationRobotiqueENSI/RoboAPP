import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:robo/Vues/customAlert.dart';
import 'package:robo/Vues/headerWidget.dart';

class loginPage extends StatelessWidget {
  const loginPage({Key? key}) : super(key: key);

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
            child: Column(children: [
              Text(
                "Welcome back!",
                style: GoogleFonts.playfairDisplay(
                    textStyle:
                        TextStyle(fontSize: 32, fontWeight: FontWeight.w600)),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Log in to your RoboCup Account!',
                style: TextStyle(
                    fontSize: 12, fontFamily: 'Roboto', color: Colors.grey),
              )
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
      child: Column(children: [
        Form(
          child: Column(
            children: [
              /****************Email Field**************************** */
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Email",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Oxygen',
                          fontSize: 13)),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 48,
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: color, width: 1.0),
                          ),
                          hintText: 'Email',
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey.shade400, width: 1.0))),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20.0),

              /**************************Password************************ */
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Password",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Oxygen',
                          fontSize: 13)),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 48,
                    child: TextFormField(
                      obscureText: true,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: color, width: 1.0),
                          ),
                          hintText: 'password',
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey.shade400, width: 1.0))),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10.0),
              Container(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () {
                    //Get.to(() => forgotPasswordPage());
                  },
                  child: Text(
                    "Forgot your password?",
                    style: TextStyle(
                      fontFamily: 'Oxygen',
                      fontSize: 12,
                      color: color,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),

              /************login buttoon***************** */
              Container(
                width: Get.width,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {},
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
                    'Login',
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
              Center(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    color: Colors.grey,
                    width: (Get.width) / 3.6,
                    height: 1,
                  ),
                  Center(
                    child: Text(
                      "OR LOGIN WITH",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  SizedBox(height: 25.0),
                  Container(
                    color: Colors.grey,
                    width: (Get.width) / 3.6,
                    height: 1,
                  ),
                ]),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: FaIcon(
                      FontAwesomeIcons.facebook,
                      size: 40,
                      color: HexColor("#3E529C"),
                    ),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AdvanceCustomAlert(
                              color: HexColor("#38972E").withOpacity(0.7),
                              message:
                                  "This feature will be available in future releases.",
                              title: "Future unavailable",
                            );
                          });
                    },
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  GestureDetector(
                    child: IconButton(
                      icon: Image.asset("assets/images/google.png"),
                      onPressed: () {},
                      color: HexColor("#DB4437"),
                    ),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AdvanceCustomAlert(
                              color: HexColor("#38972E").withOpacity(0.7),
                              message:
                                  "This feature will be available in future releases.",
                              title: "Future unavailable",
                            );
                          });
                    },
                  ),
                ],
              ),
            ],
          ),
        )
      ]),
    );
  }
}
