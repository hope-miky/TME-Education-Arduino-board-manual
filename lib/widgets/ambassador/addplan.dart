import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';

class AddPlan extends StatefulWidget {
  final screen;
  AddPlan({this.screen});

  @override
  _AddPlanState createState() => _AddPlanState();
}

class _AddPlanState extends State<AddPlan> {
  DateTime from;
  DateTime to;
  var country;

  TextEditingController _tittle = new TextEditingController();
  TextEditingController _location = new TextEditingController();
  TextEditingController _description = new TextEditingController();

  final snackBar = SnackBar(content: Text('Yay! Successfully created a plan!'));
  final errsnackBar =
      SnackBar(content: Text('Oops! Error ocured please try again'));

  CollectionReference _plannedtrips =
      FirebaseFirestore.instance.collection('plannedtrip');
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


  Future<void> addPlan() {
    return _plannedtrips.add({
      'by': FirebaseAuth.instance.currentUser.email.toString(),
      'tittle': _tittle.text,
      'location': _location.text,
      'description': _description.text,
      'from': from.toString().split(" ")[0],
      'to': to.toString().split(" ")[0],
      'country': country.countryCode + ": " + country.name
    }).then((value) {
      showInSnackBar("Success in adding trip", Colors.green);
    }).catchError((error) =>showInSnackBar("Error adding trip", Colors.red));
  }

  void showInSnackBar(String value, Color color) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(value),
      backgroundColor: color,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.screen.height * 0.7,
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomPadding: false,
        body: Container(
          color: Colors.white,
          margin: EdgeInsets.symmetric(horizontal: 20),
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Divider(),
                Center(child: Text("Add a plan")),
                Divider(),
                TextField(
                  controller: _tittle,
                  decoration: InputDecoration(labelText: "Tittle"),
                ),
                FlatButton(
                  onPressed: () async {
                    showCountryPicker(
                      context: context,
                      showPhoneCode:
                          true, // optional. Shows phone code before the country name.
                      onSelect: (Country cou) {
                        setState(() {
                          country = cou;
                        });
                      },
                    );
                  },
                  child: Text(
                    country != null
                        ? "Country = " +
                            country.countryCode +
                            ": " +
                            country.name
                        : "pick country",
                    style: TextStyle(color: Colors.teal[400]),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: TextField(
                    controller: _location,
                    decoration: InputDecoration(labelText: "Location"),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: TextField(
                    controller: _description,
                    decoration: InputDecoration(
                      labelText: "Description",
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                    maxLines: 4,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FlatButton(
                      onPressed: () async {
                        from = await showDatePicker(
                          initialDate: DateTime.now(),
                          context: context,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2255),
                        );
                        setState(() {});
                      },
                      child: Text(
                        from != null
                            ? "From = " + from.toString().split(" ")[0]
                            : "pick start date",
                        style: TextStyle(color: Colors.teal[400]),
                      ),
                    ),
                    FlatButton(
                      onPressed: () async {
                        to = await showDatePicker(
                          initialDate: DateTime.now(),
                          context: context,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2255),
                        );
                        setState(() {});
                      },
                      child: Text(
                        to != null
                            ? "To = " + to.toString().split(" ")[0]
                            : "pick final date",
                        style: TextStyle(color: Colors.amber[700]),
                      ),
                    ),
                  ],
                ),
                OutlinedButton.icon(
                  onPressed: addPlan,
                  icon: Icon(Icons.next_plan),
                  label: Text("Register Plan"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
