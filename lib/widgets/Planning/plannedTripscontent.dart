import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PlannedListContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('plannedtrip');

    return StreamBuilder<QuerySnapshot>(
      stream: users.snapshots(includeMetadataChanges: true),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return new ListView(
          children: snapshot.data.docs.map((DocumentSnapshot document) {
            return new ListTile(
              title: new Text(document.data()['tittle']),
              subtitle: new Text(
                  document.data()['from'] + " - " + document.data()['to']),
              leading: Container(
                padding: EdgeInsets.all(8),
                child: Icon(Icons.event),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.teal)),
              ),
              trailing: Text(document.data()['location']),
            );
          }).toList(),
        );
      },
    );
  }
}
