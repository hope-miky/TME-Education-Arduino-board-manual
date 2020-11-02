import 'package:flutter/material.dart';

import 'addplan.dart';

class AmbassadorDashboard extends StatefulWidget {
  final userid;
  AmbassadorDashboard({this.userid});

  @override
  _AmbassadorDashboardState createState() => _AmbassadorDashboardState();
}

class _AmbassadorDashboardState extends State<AmbassadorDashboard> {
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
      body: Container(
        child: Center(
          child: Text("Ambassador dashboard"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showLoginDialog(screen),
        child: Icon(Icons.add),
      ),
    );
  }
}
