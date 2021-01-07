import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PlanningDraggableSheet extends StatefulWidget {
  @override
  _PlanningDraggableSheetState createState() => _PlanningDraggableSheetState();
}

class _PlanningDraggableSheetState extends State<PlanningDraggableSheet> {
  TextEditingController _fullnametextcontroller = new TextEditingController();
  TextEditingController _agetextcontroller = new TextEditingController();
  TextEditingController _phonenumbertextcontroller =
      new TextEditingController();
  TextEditingController _citytextcontroller = new TextEditingController();
  String edustagedropdown;
  String country;

  CollectionReference _plannedtrips =
      FirebaseFirestore.instance.collection('registration');
  final snackBar = SnackBar(
      backgroundColor: Colors.green,
      content: Text(
          'Yay! you have been registered Successfully, We will call as soon as we planned to come to your city!'));
  final errsnackBar = SnackBar(
      backgroundColor: Colors.red,
      content: Text(
        'Oops! Error ocured please try again',
      ));

  Future register() async {
    _plannedtrips.add({
      'for': country.toLowerCase() + "@tme.com",
      'fullname': _fullnametextcontroller.text,
      'age': _agetextcontroller.text,
      'phonenumber': _phonenumbertextcontroller.text,
      'educationlevel': edustagedropdown,
      'country': country,
      'city': _citytextcontroller.text,
    }).then((value) {
      Scaffold.of(context).showSnackBar(snackBar);
      setState(() {
        _fullnametextcontroller.text = "";
        _agetextcontroller.text = "";
        _phonenumbertextcontroller.text = "";
        _citytextcontroller.text = "";
      });
    }).catchError((error) => Scaffold.of(context).showSnackBar(errsnackBar));
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return DraggableScrollableSheet(
      initialChildSize: 0.08,
      maxChildSize: 0.7,
      minChildSize: 0.06,
      builder: (context, scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: screen.width * 0.02),
            padding: EdgeInsets.symmetric(horizontal: screen.width * 0.08),
            height: screen.height,
            decoration: BoxDecoration(
                color: Colors.cyan[50],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                    bottom: 8.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Swipe to register"),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.arrow_upward,
                        size: 12,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                TextField(
                  controller: _fullnametextcontroller,
                  decoration: InputDecoration(
                      icon: Icon(Icons.account_circle_outlined),
                      hintText: "Full Name",
                      labelText: "Full Name"),
                ),
                TextField(
                  controller: _agetextcontroller,
                  decoration: InputDecoration(
                      hintText: "Age",
                      labelText: "Age",
                      icon: Icon(Icons.assignment_ind_outlined)),
                ),
                TextField(
                  controller: _phonenumbertextcontroller,
                  decoration: InputDecoration(
                      icon: Icon(Icons.phone),
                      hintText: "Phone Number",
                      labelText: "Phone Number"),
                ),
                DropdownButton(
                    value: edustagedropdown,
                    hint: Text("Education Level"),
                    items: ["Elementary", "High School", "College"]
                        .map((e) => DropdownMenuItem(
                              child: Text(e),
                              value: e,
                            ))
                        .toList(),
                    onChanged: (val) {
                      setState(() {
                        edustagedropdown = val;
                      });
                    }),
                DropdownButton(
                    value: country,
                    hint: Text("Country"),
                    items: [
                    "India", 
                    "Cameroon", 
                    "Ghana", 
                    "Tanzania",
                    "Rwanda",
                    "Zambia",
                    "Tunisia",
                    "Eswatini",
                    "Mauritania",
                    "Mozambique",
                    "Madagascar",
                    "Nigeria",
                    "South Africa",
                    "Uganda",
                    "Malawi",
                    "Kenya",
                    "Ethiopia",
                    "Egypt"
                    ]
                        .map((e) => DropdownMenuItem(
                              child: Text(e),
                              value: e,
                            ))
                        .toList(),
                    onChanged: (val) {
                      setState(() {
                        country = val;
                      });
                    }),
                TextField(
                  controller: _citytextcontroller,
                  decoration:
                      InputDecoration(hintText: "City", labelText: "City"),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: RaisedButton(
                    color: Colors.teal,
                    onPressed: register,
                    child: Text(
                      "Register",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
