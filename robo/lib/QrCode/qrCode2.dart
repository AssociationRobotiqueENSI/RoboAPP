import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qr_bar_scanner/qr_bar_scanner_camera.dart';

import '../models/Homologation/homologationFiche.dart';
import '../models/jury/juryFiche.dart';

class Second extends StatefulWidget {
  late String page ;
  Second(this.page);
  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {
  final CollectionReference teams = FirebaseFirestore.instance.collection('teams');
  String? _qrInfo = 'Scan a QR code';
  bool camState = false;
  late bool lunchok=false ;

  qrCallback(String? code) {
    setState(() {
      camState = false;
      _qrInfo = code;
    });
  }
  Text lunch(bool lunch){
    if (lunch){
      lunch=false;
      return Text('already !');

    }
    return Text(_qrInfo!,style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30,
        letterSpacing: 2));
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      camState = true;
    });
  }
  Future<QueryDocumentSnapshot<Map<String, dynamic>>?> inscrit (String _qrInfo) async{

    var querySnapshot = await FirebaseFirestore.instance
        .collection('teams')
        .where('robotName', isEqualTo: _qrInfo)
        .limit(1)
        .get();
    if (querySnapshot.docs.isNotEmpty) {
      switch (widget.page) {
        case "homologation" :
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return homologationfiche(querySnapshot.docs.first);
            }),
          );
          break;
        case "reception" :
          try {
            var docRef = querySnapshot.docs.first.reference;
            await docRef.update({
              'arrive': 'ok',
            });
            print('Field updated successfully!');
          } catch (e) {
            print('Error updating field: $e');
          }
          break;
        case "jury" :
          Navigator.push(context, MaterialPageRoute(builder: (context)=>juryFiche(querySnapshot.docs.first)));
          break;
        case "lunch" :
          var docRef = querySnapshot.docs.first.reference;
          var docSnapshot = await docRef.get();
            var data = docSnapshot.data();
            if (data!['lunch'] == 'ok') {
                lunchok = true;
              print('Field is already set to ok');

          } else {
            try {
              await docRef.update({
                'lunch': 'ok',
              });

              print('Field updated successfully!');
            } catch (e) {
              print('Error updating field: $e');
            }
          }
          break;


      }
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (camState == true) {
            setState(() {
              camState = false;
            });
          } else {
            setState(() {
              camState = true;
            });
          }
        },
        child: Icon(Icons.camera),
      ),
      body: camState
          ? Center(
        child: SizedBox(
          height: 1000,
          width: 500,
          child: QRBarScannerCamera(
            onError: (context, error) => Text(
              error.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.red),
            ),
            qrCodeCallback: (code) {
              qrCallback(code);
              inscrit(_qrInfo!);
            },
          ),
        ),
      )
          : Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [


            lunch(lunchok),
            SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }
}