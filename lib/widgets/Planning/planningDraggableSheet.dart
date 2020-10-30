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
                  controller: _agetextcontroller,
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
                    items: ["Ethiopia", "India", "Camerron", "Ghana", "Nigeria"]
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
                    onPressed: () {},
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
