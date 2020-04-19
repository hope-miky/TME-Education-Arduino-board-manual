import 'package:flutter/material.dart';


class IntroPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image.asset("assets/images/main_images/logo.png"),
              width: screensize.width / 2,
              ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: screensize.width / 5),
              child: Text(
                "A programme that aims to promote and popularize electronics and technology-related knowledge around the world.",
                textAlign: TextAlign.justify,
              ),
            ),

            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/homepage");
              },
              child: Text("Continue", style: TextStyle(color: Colors.white),),
              color: Colors.teal,
              )
          ],
        ),
      ),

    );
  }
}
