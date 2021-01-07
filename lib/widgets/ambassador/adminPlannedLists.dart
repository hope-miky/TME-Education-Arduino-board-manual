import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AdminPlannedList extends StatefulWidget {
  @override
  _AdminPlannedListState createState() => _AdminPlannedListState();
}

class _AdminPlannedListState extends State<AdminPlannedList> {
  var users = FirebaseFirestore.instance
      .collection('plannedtrip')
      .where("by",
          isEqualTo: FirebaseAuth.instance.currentUser.email.toString())
      .snapshots(includeMetadataChanges: true);
  CollectionReference profile;
  FirebaseAuth auth;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


  void showInSnackBar(String value, Color color) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(value),
      backgroundColor: color,
    ));
  }

  @override
  void initState() {
    super.initState();

    profile = FirebaseFirestore.instance.collection('users');
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
          body: Container(
        child: StreamBuilder<QuerySnapshot>(
          stream: users,
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  Text("Loading"),
                ],
              ));
            }

            return new ListView(
              children: snapshot.data.docs.map((DocumentSnapshot document) {
                // print("==========================");
                // print(document.data());
                // print("==========================");
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15.0, vertical: 3),
                  child: Card(
                    elevation: 5,
                    child: new ExpansionTile(
                      title: new Text(document.data()['tittle']),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("On " + document.data()['from'].toString()),
                          Text(" Place: " + document.data()['location']),
                        ],
                      ),
                      leading: Container(
                        padding: EdgeInsets.all(8),
                        child: Icon(Icons.event),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.teal)),
                      ),
                      children: [
                        Text(document.data()['description'].toString()),
                        IconButton(
                            icon: Icon(Icons.delete, color: Colors.red,),
                            onPressed: () async {
                              await FirebaseFirestore.instance.runTransaction((Transaction myTransaction) async {
                                    await myTransaction.delete(document.reference);
                                });

                                setState(() {
                                });

                            })
                      ],
                    ),
                  ),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
