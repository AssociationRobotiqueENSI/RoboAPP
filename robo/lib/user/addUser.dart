import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/User.dart';
import 'package:robo/Vues/headerWidget.dart' ;

enum role { reception, homologation, jury, admin,lunch }
class AddUser extends StatefulWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  @override

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future createUser(String email,String password ,String role) async {
    final docComp =
    FirebaseFirestore.instance.collection("users").doc();
    final user= Userr(email,  password, role);

    final json = user.toJson();
    await docComp.set(json);
    Get.defaultDialog(
      title: "GeeksforGeeks",
      middleText: "Hello world!",
      backgroundColor: Colors.green,
      titleStyle: TextStyle(color: Colors.white),
      middleTextStyle: TextStyle(color: Colors.white),
    );
/*    emailController.clear();
    passwordController.clear();*/
  }
  Future<UserCredential?> createUserWithEmailAndPassword(String email, String password) async {

    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential ;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e.toString());
    }
    return null ;

  }
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
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Add a user",
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
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    roleController.dispose();
    super.dispose();
  }
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final roleController = TextEditingController();
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
                  Text("Email",
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
                      controller: emailController,
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

              /**************************Task************************ */



              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Text("Password",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Oxygen',
                            fontSize: 25)),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                  ),
                  Container(
                    height: 48,
                    child: TextFormField(
                      obscureText: false,
                      controller: passwordController,
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
                  ),
                  Row(children: [
                    Text("Role",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Oxygen',
                            fontSize: 25)),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                  ),
    DropdownButton<String>(
      value: roleController.text != null && roleController.text.isNotEmpty
          ? roleController.text
          : 'admin',
    onChanged: (String? newValue) {
    setState(() {
    roleController.text = newValue!;
    });
    },
    items: <String>['admin', 'homologation', 'jury', 'reception','lunch']
        .map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
    value: value,
    child: Text(value),
    );
    }).toList(),
    ),





              /************ buttoon***************** */
              Container(
                width: Get.width,
                height: 40,
                child: ElevatedButton(
                  onPressed: () async{
                    final String email = emailController.text.trim();
                    final String password = passwordController.text.trim();
                    final String role = roleController.text.trim();
    if (email.isNotEmpty && password.isNotEmpty && role.isNotEmpty) {
                    await createUser(emailController.text,passwordController.text, roleController.text );
                    await createUserWithEmailAndPassword(emailController.text,passwordController.text);
                    emailController.clear();
                    passwordController.clear();
                    roleController.clear();
    }
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
                    'Add User',
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
]))]));

}

}