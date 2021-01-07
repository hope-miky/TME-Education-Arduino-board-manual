import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:tme_ard_v2/widgets/Planning/plannedTripscontent.dart';
import 'package:tme_ard_v2/widgets/Planning/planningDraggableSheet.dart';
import 'package:tme_ard_v2/widgets/registration/login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PlannedTripsList extends StatefulWidget {
  @override
  _PlannedTripsListState createState() => _PlannedTripsListState();
}

class _PlannedTripsListState extends State<PlannedTripsList> {
  bool _initialized = false;
  bool _error = false;
  bool loading = false;

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
    Size screen = MediaQuery.of(context).size;
    void showLoginDialog() async {
      await showGeneralDialog(
        context: context,
        barrierLabel: "Barrier",
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.5),
        transitionDuration: Duration(milliseconds: 700),
        pageBuilder: (_, __, ___) {
          return Align(
            alignment: Alignment.center,
            child: LoginPage(
              screen: screen,
            ),
          );
        },
        transitionBuilder: (_, anim, __, child) {
          return SlideTransition(
            position:
                Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
            child: child,
          );
        },
      ).then((value) {});
    }

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
        backgroundColor: Colors.white24,
        elevation: 0,
        leading: Container(),
        title: Text(
          "Planned List",
          style: TextStyle(color: Colors.teal),
        ),
        actions: [
          FlatButton.icon(
            onPressed: () => showLoginDialog(),
            icon: Icon(
              Icons.login,
              color: Colors.amber[700],
            ),
            label: Text(
              "Login",
              style: TextStyle(color: Colors.amber[700]),
            ),
          )
        ],
      ),
      body: Stack(
        children: [PlannedListContent(), PlanningDraggableSheet()],
      ),
    );
  }
}
