import 'package:flutter/material.dart';

class AmbassadorDashboard extends StatefulWidget {
  AmbassadorDashboard({Key key}) : super(key: key);

  @override
  _AmbassadorDashboardState createState() => _AmbassadorDashboardState();
}

class _AmbassadorDashboardState extends State<AmbassadorDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("Ambassador dashboard"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
