import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:robo_cup/models/Tache.dart';

class competition {
  String? nom;
  String? image;
  List<Tache>? tache;
  final DocumentReference? reference;

  competition({this.reference, this.nom, this.tache, this.image});

  competition.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['nom'] != null),
        assert(map['taches'] != null),
        nom = map['nom'],
        tache = map['taches'];
  competition.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nom'] = this.nom;
    if (this.tache != null) {
      data['tache'] = this.tache!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
