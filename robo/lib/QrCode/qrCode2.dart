import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qr_bar_scanner/qr_bar_scanner_camera.dart';

import '../models/Homologation/homologationFiche.dart';

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

  qrCallback(String? code) {
    setState(() {
      camState = false;
      _qrInfo = code;
    });
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
          Navigator.push(context, MaterialPageRoute(builder: (context)=>homologationFiche(querySnapshot.docs.first)));
          break;
       /* case "jury" :
          Navigator.push(context, MaterialPageRoute(builder: (context)=>juryFiche()));
          break; */



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
            Text(
              "Code :" + _qrInfo!,
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}