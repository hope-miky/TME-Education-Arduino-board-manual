import 'package:flutter/material.dart';
import 'package:tme_ard_v2/widgets/reusable/info.dart';


class CoddingIntro extends StatelessWidget {
  const CoddingIntro({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.teal[50],
        iconTheme: IconThemeData(
          color: Colors.teal
        ),
        actions: [
            InfoIcon(color: Colors.teal,)
          ]
      ),
      backgroundColor: Colors.teal[50],
          body: SingleChildScrollView(
        child: Column(
          
          children: <Widget>[
            SizedBox(height: 20,),
            Card(
              color: Colors.teal,
              elevation: 6,
              child: Container(
                width: double.infinity,
                child: Center(
                  child: Text("Programming the educational board", 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Quicksand", 
                    fontSize: 22,
                    color: Colors.white
                        ),
                      ),
                    ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Text("Programmes written for Arduino are called sketches. All programmes should include the setup and loop functions. Instructions included in the setup function are performed only once (when turning Arduino on). All settings and instructions to be performed at the beginning of the device operation should be placed here (immediately after switching on).",
              textAlign: TextAlign.justify,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Text("The loop function acts as an infinite loop. Instructions contained inside it will be performed all the time. This loop starts after the instructions inside the setup function are completed.",
              textAlign: TextAlign.justify,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
              child: Text("A blank sketch, which should be the starting point for each programme:",
              textAlign: TextAlign.justify,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
              child: Image.asset("assets/images/codding/1.png"),
            ),

            Card(
              color: Colors.teal,
              elevation: 6,
              child: Container(
                
                width: double.infinity,
                child: Center(
                  child: Text("Comments", 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Quicksand", 
                    fontSize: 22,
                    color: Colors.white
                        ),
                      ),
                    ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Text("It’s possible to add comments inside the programme, i.e. information that are skipped when sending a sketch to Arduino, and they are only meant to make it easier for programmers to understand the code. Comments can be placed in one line (then they should be preceded by \"\/\/\" characters) or in many lines (then the comment text should be placed between \"\/\*\" and \"\*\/\" characters).",
              textAlign: TextAlign.justify,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Image.asset("assets/images/codding/2.png"),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Text("Comments can be placed in any part of the programme. Often they are also used to temporarily\"turn off\" a part of the programme, e.g. for testing time.",
              textAlign: TextAlign.justify,
              ),
            ),


            Card(
              color: Colors.teal,
              elevation: 6,
              child: Container(
                
                width: double.infinity,
                child: Center(
                  child: Text("Uploading the programme to the board", 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Quicksand", 
                    fontSize: 22,
                    color: Colors.white
                        ),
                      ),
                    ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Text("To upload the programme to the Arduino, first you need to (one time only):",
              textAlign: TextAlign.justify,
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text("1. connect the board with a USB cable to the computer,",
              textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text("2. from the Arduino IDE toolbar choose: Tools > Board > Arduino/Genuino UNO,",
              textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text("3. from the Arduino IDE toolbar select: Tools > Port and there check the number of the COM port, next to which the name Arduino UNO appeared.",
              textAlign: TextAlign.justify,
              ),
            ),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Text("Then, in order to compile the programme (i.e. translate it into a language understandable for Arduino) and upload it to the board, click the option Upload, which is visible in the Arduino IDE menu in the form of a round icon with an arrow to the right. After programme is loaded correctly, a corresponding message will appear at the bottom of the IDE, e.g. \"Upload completed\", and after a while the code will start working on the board.",
              textAlign: TextAlign.justify,
              ),
            ),

            

            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: Colors.teal), bottom: BorderSide(color: Colors.teal))
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Text("If an optional Bluetooth module is connected to the system, the appropriate slide switch should be set to BT OFF when the programme is loaded onto the board.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.green,
                  fontStyle: FontStyle.italic,
                  fontFamily: "Quicksand"
                ),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}