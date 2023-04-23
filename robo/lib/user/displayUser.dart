import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:robo/Vues/headerWidget.dart';
import 'package:robo/models/User.dart';

class displayUser extends StatefulWidget {
  const displayUser({Key? key}) : super(key: key);

  @override
  State<displayUser> createState() => _displayUserState();
}

class _displayUserState extends State<displayUser> {
  final Stream<QuerySnapshot> userStream =
  FirebaseFirestore.instance.collection('users').snapshots();
  final ScrollController _gridViewController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: userStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return Scaffold(
            body: Column(
              children: [
                Container(
                  height: Get.height / 3,
                  child: headerWidget(),
                ),
                SizedBox(
                  height: 15,
                ),
                Text("Users",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        letterSpacing: 2)),
                SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 50, left: 20, right: 20),
                    height: Get.height / 2.28,
                    child: GridView(
                      controller: _gridViewController,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          mainAxisExtent: 220,
                          maxCrossAxisExtent: 220,
                          childAspectRatio: 3 / 2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15),
                      children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;

                        return userItem(data,document.id);
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ));
      },
    );
  }
}

Widget userItem(data,String documentId) {
  return Stack(
    children: [
      Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage("assets/images/img.png"),
              fit: BoxFit.cover,
            ),
          )),
      Container(
        key: ValueKey(data["email"]),
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
            padding: EdgeInsets.all(20),
            height: Get.height / 8,
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
                    "${data["email"]}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 5,
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
                    deleteDocument('users',documentId);
                  },
                  icon: Icon(FontAwesomeIcons.solidTrashAlt,
                      size: 20, color: Colors.red)),
            ],
          )),
    ],
  );
}

Future<void> deleteDocument(String collectionName, String documentId) async {
  User user = FirebaseAuth.instance.currentUser!;
  try {
    await FirebaseFirestore.instance
        .collection(collectionName)
        .doc(documentId)
        .delete();
    await user.delete();
    print("Document deleted successfully.");
  } catch (e) {
    print("Failed to delete document: $e");
  }
}
