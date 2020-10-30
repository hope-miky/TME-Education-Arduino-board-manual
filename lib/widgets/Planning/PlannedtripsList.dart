import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:tme_ard_v2/widgets/Planning/planningDraggableSheet.dart';

class PlannedTripsList extends StatefulWidget {
  PlannedTripsList({Key key}) : super(key: key);

  @override
  _PlannedTripsListState createState() => _PlannedTripsListState();
}

class _PlannedTripsListState extends State<PlannedTripsList> {
  bool _initialized = false;
  bool _error = false;

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_error) {
      return Scaffold(
        body: Center(
          child: Text("Error"),
        ),
      );
    }

    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Planned List"),
      ),
      body: Stack(
        children: [UserInformation(), PlanningDraggableSheet()],
      ),
    );
  }
}

class UserInformation extends StatelessWidget {
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
