import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:robo/models/Tache.dart';

class Competition {
  String nom = '';
  List<dynamic> tache = [];

  Competition(this.nom, this.tache);
  Map<String, String> toJson() => {'nom': nom, 'taches': tache.toString()};
  static Competition fromJson(Map<String, dynamic> json) =>
      Competition(json['nom'], []);
  Competition.fromMap(QuerySnapshot<Competition?> map) {
    //nom = map['nom'];
    //tache = map['taches'];
  }
}
