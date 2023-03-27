//liaision avec l'api

import 'dart:convert';

import 'package:robo_cup/models/Competition.dart';
import 'package:http/http.dart' as http;

class CompetitionService {
  /************************FromJsonToList******************* */
  List<competition> fromResponseToList(responseData) {
    List<competition> competitions = [];
    return competitions;
  }

  /***********************Get************************** */
  Future<List<competition>> fetchCompetition() async {
    List<competition> competitions = [];
    try {
      String baseUrl =
          "https://roboapp-1cea5-default-rtdb.firebaseio.com/compétitions.json";
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        var reponseData = jsonDecode(response.body);
        print(reponseData);
      }
    } catch (e) {
      print("Couche Service \nErreuuuur fetch competition " + e.toString());
    }

    return competitions;
  }
}
