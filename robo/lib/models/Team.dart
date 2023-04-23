import 'package:cloud_firestore/cloud_firestore.dart';
enum CompetitionType { suiveur, toutTerrain, autonome, junior }
class Team {

  final String teamName;
  final String robotName;
  final String teamChef;
  final String CompetitionType;
  final String phoneNumber;
  final String homologation ;
  final String lunch ;
  final String arrive;


  Team(   {
    required this.teamName,
    required this.robotName,
    required this.teamChef,
    required this.CompetitionType,
    required this.phoneNumber,
    required this.homologation ,
  required this.lunch,
  required this.arrive,


  });

  // Create a map from Team object
  Map<String, dynamic> toMap() {
    return {
      'teamName': teamName,
      'robotName': robotName,
      'teamChef': teamChef,
      'competitionType': CompetitionType,
      'phoneNumber': phoneNumber,
      'homologation' : homologation,
      'lunch': lunch,
      'arrive':arrive
    };
  }

  // Create a Team object from DocumentSnapshot
  factory Team.fromSnapshot(DocumentSnapshot documentSnapshot) {
    Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;

    return Team(
      teamName: data?['teamName'] ?? '',
      robotName: data?['robotName'] ?? '',
      teamChef: data?['teamChef'] ?? '',
      CompetitionType: data?['competitionType'] ?? '',
      phoneNumber: data?['phoneNumber'] ?? '',
      homologation: data?['homologation'] ?? '',
      lunch: data?['lunch'] ?? '',
      arrive: data?['arrive'] ?? '',
    );
  }
}