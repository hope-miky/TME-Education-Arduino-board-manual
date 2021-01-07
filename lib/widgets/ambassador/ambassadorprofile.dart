import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AmbassadorProfile extends StatefulWidget {
  @override
  _AmbassadorProfileState createState() => _AmbassadorProfileState();
}

class _AmbassadorProfileState extends State<AmbassadorProfile> {
  var users = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser.email.toString());

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Container(
      height: screen.height,
      child: StreamBuilder<DocumentSnapshot>(
        stream: users.snapshots(includeMetadataChanges: true),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
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

          return SingleChildScrollView(
            child: Container(
              height: screen.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(snapshot.data["fullname"]),
                  Text(snapshot.data["phonenumber"]),
                  Text(snapshot.data["email"]),
                  Text(snapshot.data["facebook"]),
                  Text(snapshot.data["groupfb"]),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
