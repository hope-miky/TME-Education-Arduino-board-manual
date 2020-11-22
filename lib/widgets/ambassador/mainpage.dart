import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tme_ard_v2/app_theme.dart';
import 'package:tme_ard_v2/widgets/ambassador/adminPlannedLists.dart';
import 'package:tme_ard_v2/widgets/ambassador/registeredUsersList.dart';

import 'addplan.dart';

class AmbassadorDashboard extends StatefulWidget {
  final userid;
  AmbassadorDashboard({this.userid});

  @override
  _AmbassadorDashboardState createState() => _AmbassadorDashboardState();
}

class _AmbassadorDashboardState extends State<AmbassadorDashboard> {
  CollectionReference users =
      FirebaseFirestore.instance.collection('plannedtrip');
  int index = 0;
  List<Widget> content = [AdminPlannedList(), RegisteredUsersList()];

  void showLoginDialog(screen) async {
    await showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      pageBuilder: (_, __, ___) {
        return Align(
          alignment: Alignment.center,
          child: AddPlan(
            screen: screen,
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
          child: child,
        );
      },
    ).then((value) {});
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Admin console",
          style: AppTheme.caption.copyWith(color: Colors.teal, fontSize: 20),
        ),
        elevation: 0,
        backgroundColor: Colors.white10,
      ),
      body: content.elementAt(index),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showLoginDialog(screen),
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (idx) {
          setState(() {
            index = idx;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "Planned list",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.group_outlined), label: "Registered users")
        ],
      ),
    );
  }
}
