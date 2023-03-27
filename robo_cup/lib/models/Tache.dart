class Tache {
  String? nom;
  int? note;
  int? valeurMax;

  Tache({this.nom, this.note, this.valeurMax});

  Tache.fromJson(Map<String, dynamic> json) {
    nom = json['nom'];
    note = json['note'];
    valeurMax = json['valeurMax'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nom'] = this.nom;
    data['note'] = this.note;
    data['valeurMax'] = this.valeurMax;
    return data;
  }
}
