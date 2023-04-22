

import 'package:flutter/material.dart';
import 'package:robo/QrCode/qrCode2.dart';
class First extends StatefulWidget {
  late String page ;
  First(this.page);

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(
                  Icons.qr_code_scanner,
                  size: 40,
                ),
              ),
            ],
          ),
          title: Text(
            'QRcode Scanner',
          ),
        ),
        body: TabBarView(
          children: [
            Second(widget.page),
          ],
        ),
      ),
    );
  }
}