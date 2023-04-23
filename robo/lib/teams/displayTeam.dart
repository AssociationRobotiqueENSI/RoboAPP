

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/Team.dart';
import 'addTeam2.dart';


enum competitionType { suiveur, toutTerrain, autonome, junior }



class TeamList extends StatelessWidget {
  const TeamList({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    Color c1 = Theme.of(context).primaryColor;
    final CollectionReference teams =
    FirebaseFirestore.instance.collection('teams');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Team List'),
        backgroundColor: c1,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: teams.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (BuildContext context, int index) {
              final Team team =
              Team.fromSnapshot(snapshot.data!.docs[index]);
              String teamId =snapshot.data!.docs[index].id ;
              return ListTile(
                title: Text(team.teamName),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Robot Name: ${team.robotName}'),
                    Text('Team Chef: ${team.teamChef}'),
                    Text('Competition Type: ${team.CompetitionType}'),
                    Text('Phone Number: ${team.phoneNumber}'),
                  ],
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    teams.doc(teamId).delete();
                  },
                ),
                onTap: () {
                  _openEditTeamDialog(context, teams, team ,teamId);
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /*  showDialog(
            context: context,
            builder: (BuildContext context) {
              final teamNameController = TextEditingController();
              final robotNameController = TextEditingController();
              final teamChefController = TextEditingController();
              final competitionTypeController = TextEditingController();
              final phoneNumberController = TextEditingController();

              return AlertDialog(
                title: const Text('Add Team'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: teamNameController,
                      decoration: const InputDecoration(
                        labelText: 'Team Name',
                      ),
                    ),
                    TextField(
                      controller: robotNameController,
                      decoration: const InputDecoration(
                        labelText: 'Robot Name',
                      ),
                    ),
                    TextField(
                      controller: teamChefController,
                      decoration: const
                      InputDecoration(
                        labelText: 'Team Chef',
                      ),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {

                              competitionTypeController.text = CompetitionType.suiveur.toString();

                            },
                            child: Text('suiveur'),
                          ),
                          ElevatedButton(
                            onPressed: () {

                              competitionTypeController.text = CompetitionType.toutTerrain.toString();

                            },
                            child: Text('Tout terrain'),
                          ),]
                    ),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {

                            competitionTypeController.text = CompetitionType.autonome.toString();

                          },
                          child: Text('autonome'),
                        ),
                        ElevatedButton(
                          onPressed: () {

                            competitionTypeController.text = CompetitionType.junior.toString();

                          },
                          child: Text('junior'),
                        ),
                      ],
                    ),

                    TextField(
                      controller: phoneNumberController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        labelText: 'Phone Number',
                      ),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    child: const Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: const Text('Save'),
                    onPressed: () {
                      final teamName = teamNameController.text;
                      final robotName = robotNameController.text;
                      final teamChef = teamChefController.text;
                      final competitionType = competitionTypeController;
                      final phoneNumber = phoneNumberController.text;
                      teams.add(Team(
                        teamName: teamName,
                        robotName: robotName,
                        teamChef: teamChef,
                        competitionType: competitionType.text,
                        phoneNumber: phoneNumber,
                      ).toMap());

                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        */
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const addTeams()),
          );

        },


        child: const Icon(Icons.add),
      ),
    );
  }

  void _openEditTeamDialog(BuildContext context, CollectionReference teams, Team team , String teamId) {
    Color c1 = Theme.of(context).primaryColor;
    final teamNameController = TextEditingController(text: team.teamName);
    final robotNameController = TextEditingController(text: team.robotName);
    final teamChefController = TextEditingController(text: team.teamChef);
    final competitionTypeController =
    TextEditingController(text: team.CompetitionType);
    final phoneNumberController =
    TextEditingController(text: team.phoneNumber);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Team'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: teamNameController,
                decoration: const InputDecoration(
                  labelText: 'Team Name',
                ),
              ),
              TextField(
                controller: robotNameController,
                decoration: const InputDecoration(
                  labelText: 'Robot Name',
                ),
              ),
              TextField(
                controller: teamChefController,
                decoration: const InputDecoration(
                  labelText: 'Team Chef',
                ),
              ),
              Row(children: [
                Text("Competition:",
                    style: TextStyle(
                        fontSize: 20)),
                SizedBox(
                  height: 10,
                ),
              ],
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {

                        competitionTypeController.text = competitionType.suiveur.toString();

                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        minimumSize: MaterialStateProperty.all(Size(20, 20)),
                        backgroundColor: MaterialStateProperty.all(c1),
                      ),
                      child: Text('suiveur'),
                    ),
                    ElevatedButton(
                      onPressed: () {

                        competitionTypeController.text = competitionType.toutTerrain.toString();

                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        minimumSize: MaterialStateProperty.all(Size(20, 20)),
                        backgroundColor: MaterialStateProperty.all(c1),
                      ),
                      child: Text('Tout terrain'),
                    ),]
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {

                      competitionTypeController.text = competitionType.autonome.toString();

                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      minimumSize: MaterialStateProperty.all(Size(20, 20)),
                      backgroundColor: MaterialStateProperty.all(c1),
                    ),
                    child: Text('autonome'),
                  ),
                  ElevatedButton(
                    onPressed: () {

                      competitionTypeController.text = competitionType.junior.toString();

                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      minimumSize: MaterialStateProperty.all(Size(20, 20)),
                      backgroundColor: MaterialStateProperty.all(c1),
                    ),
                    child: Text('junior'),
                  ),
                ],
              ),

              TextField(
                controller: phoneNumberController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Save'),
              onPressed: () {
                final teamName = teamNameController.text;
                final robotName = robotNameController.text;
                final teamChef = teamChefController.text;
                final competitionType = competitionTypeController.text;
                final phoneNumber = phoneNumberController.text;

                teams.doc(teamId).update(Team(
                  teamName: teamName,
                  robotName: robotName,
                  teamChef: teamChef,
                  CompetitionType: competitionType,
                  phoneNumber: phoneNumber,
                  homologation: "",
                  lunch: "",
                  arrive: "",
                ).toMap());

                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}