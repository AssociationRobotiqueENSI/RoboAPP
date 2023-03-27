import 'package:flutter/material.dart';
import 'package:robo_cup/models/Tache.dart';

class competition {
  String? nom;
  String? image;
  List<Tache>? tache;

  competition({this.nom, this.tache, this.image});

  competition.fromJson(Map<String, dynamic> json) {
    nom = json['nom'];
    if (json['tache'] != null) {
      tache = <Tache>[];
      json['tache'].forEach((v) {
        tache!.add(new Tache.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nom'] = this.nom;
    if (this.tache != null) {
      data['tache'] = this.tache!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
