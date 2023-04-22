import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class homologationFiche extends StatefulWidget {
  QueryDocumentSnapshot<Map<String, dynamic>> data ;
  homologationFiche(this.data);

  @override
  State<homologationFiche> createState() =>_homologationFicheState();

}


class _homologationFicheState extends State<homologationFiche> {
  late int somme=0 ;
  List<int> notes = [0, 0, 0, 0, 0];
  List<String> questions = [    'Question 1',    'Question 2',    'Question 3',    'Question 4',    'Question 5',  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fiche de notes'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'robotName: ${widget.data.data()['robotName']}',
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              'teamChef: ${widget.data.data()['teamChef']}',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Questions:',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: questions.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            questions[index],
                            style: TextStyle(fontSize: 18.0),
                          ),
                          Container(
                            width: 60.0,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                setState(() {
                                  notes[index] = int.parse(value);
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16.0),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  somme = notes[0]+notes[1]+notes[2]+notes[3]+notes[4];
                  DocumentReference docRef = widget.data.reference;

                  try {
                    await docRef.update({
                      'phoneNumber': somme.toString(),
                    });
                    print('Field updated successfully!');
                  } catch (e) {
                    print('Error updating field: $e');
                  }
                  Navigator.of(context).pop();
                },
                child: Text('Enregistrer'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


