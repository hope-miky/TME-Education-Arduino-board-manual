import 'package:flutter/material.dart';

class Libraries extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final Size screensize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.teal[50],
      appBar: PreferredSize(
        child: Padding(
          padding: const EdgeInsets.only(top: 25,),
          child: Container(
            color: Colors.transparent,
            child: Row(
              children: <Widget>[
                Container(
                  width: 80,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(30))
                  ),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back), 
                    onPressed: (){},
                    color: Colors.white,
                    ),
                ),
              ],
            ),
          ),
        ), 
        preferredSize: Size(100,60)
        ),
          body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text("sample text"),
          ],
        )
      ),
    );
  }
}