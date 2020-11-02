import 'package:flutter/material.dart';

class AddPlan extends StatefulWidget {
  final screen;
  AddPlan({this.screen});

  @override
  _AddPlanState createState() => _AddPlanState();
}

class _AddPlanState extends State<AddPlan> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.screen.height * 0.7,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomPadding: false,
        body: Container(
          color: Colors.white,
          margin: EdgeInsets.symmetric(horizontal: 20),
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(child: Text("Add a plan")),
                TextField(
                  decoration: InputDecoration(labelText: "Tittle"),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: TextField(
                    decoration: InputDecoration(labelText: "Location"),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: TextField(
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
                    RaisedButton(
                      onPressed: () async {
                        await showDatePicker(
                          initialDate: DateTime.now(),
                          context: context,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2255),
                        );
                      },
                      child: Text("From"),
                    ),
                    RaisedButton(
                      onPressed: () async {
                        await showDatePicker(
                          initialDate: DateTime.now(),
                          context: context,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2255),
                        );
                      },
                      child: Text("To"),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
