import 'package:get/get.dart';
import 'package:robo_cup/Services/CompetitionService.dart';
import 'package:robo_cup/models/Competition.dart';
import 'package:robo_cup/models/Tache.dart';

class CompetitionController extends GetxController {
  List<competition> competitions = [];

  CompetitionService competitionService = CompetitionService();
  getCompetitions() async {
    try {
      /**************************Tout_Terrain *****************************/

      competition Tout_Terrain = new competition(
          nom: "Tout Terrain",
          image: "assets/images/tout-terrain.png",
          tache: [
            new Tache(nom: "tache1", note: 2, valeurMax: 2),
            new Tache(nom: "tache2", note: 2, valeurMax: 2),
            new Tache(nom: "tache3", note: 2, valeurMax: 2)
          ]);
      /**************************junior *****************************/

      competition junior = new competition(
          nom: "junior",
          image: "assets/images/junior.png",
          tache: [
            new Tache(nom: "tache1", note: 2, valeurMax: 2),
            new Tache(nom: "tache2", note: 2, valeurMax: 2),
            new Tache(nom: "tache3", note: 2, valeurMax: 2)
          ]);
      /**************************Autonome *****************************/

      competition autonome = new competition(
          nom: "autonome",
          image: "assets/images/autonome.png",
          tache: [
            new Tache(nom: "tache1", note: 2, valeurMax: 2),
            new Tache(nom: "tache2", note: 2, valeurMax: 2),
            new Tache(nom: "tache3", note: 2, valeurMax: 2)
          ]);
      /**************************Suiveur *****************************/
      competition suiveur = new competition(
          nom: "suiveur",
          image: "assets/images/suiveur.png",
          tache: [
            new Tache(nom: "tache1", note: 2, valeurMax: 2),
            new Tache(nom: "tache2", note: 2, valeurMax: 2),
            new Tache(nom: "tache3", note: 2, valeurMax: 2)
          ]);
      competitions.add(suiveur);
      competitions.add(autonome);
      competitions.add(Tout_Terrain);
      competitions.add(junior);
    } catch (e) {
      print("Competition Controller : getCompetitions() $e");
    }
  }
}
