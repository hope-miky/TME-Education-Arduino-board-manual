import 'package:flutter/material.dart';
import 'package:tme_ard_v2/app_theme.dart';
import 'dart:async';


import 'package:url_launcher/url_launcher.dart';

class IntroToTME extends StatelessWidget {
  const IntroToTME({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.chipBackground,
      appBar: AppBar(
        backgroundColor: AppTheme.chipBackground,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.teal),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20,),
            Card(
              color: Colors.teal,
              elevation: 6,
              child: Container(
                height: 50,
                width: double.infinity,
                child: Center(
                  child: Text("Introduction", 
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
              child: Text("The TME-EDU-ARD-2 educational board for learning of Arduino programming has been prepared for the needs of the TME Education programme. More information on the subject can be found at ",
              textAlign: TextAlign.justify,
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Spacer(),
                InkWell(
                  onTap: () async {
                      const url = 'https://www.tmeeducation.com';
                      if (await canLaunch(url)) {
                        await launch(url, forceSafariVC: false);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                  child: Card(
                    color: Colors.deepOrange,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child: Center(child: Text("Offcial website", style: TextStyle(color:Colors.white))),
                    ),
                  ),
                ),

                Spacer(),

                InkWell(
                  onTap: () async {
                      const url = 'https://fb.com/tmeeducation';
                      if (await canLaunch(url)) {
                        await launch(url, forceSafariVC: false);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                  child: Card(
                    color: Colors.indigoAccent,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child: Center(child: Text("Offcial Facebook page", style: TextStyle(color:Colors.white),)),
                    ),
                  ),
                ),

                Spacer(),

              ],
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Text("This documentation describes the use of peripherals included in the TME-EDU-ARD-2 educational board, which works with the popular Arduino UNO controller. The board has over 20 peripherals using all available outputs of the controller. The elements are connected, however, it is still possible to change these connections using the jumpers (more on this later).",
              textAlign: TextAlign.justify,
              ),
            ),

            Card(
              color: Colors.teal,
              elevation: 6,
              child: Container(
                height: 50,
                width: double.infinity,
                child: Center(
                  child: Text("What is Arduino?", 
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
              child: Text("Arduino platform is one of the most popular solutions dedicated to beginners to electronics in the world. It integrates popular AVR microcontrollers and dedicated, beginners-friendly programming language (based on C / C++) into a coherent and easy-to-use tool with an infinite number of applications.",
              textAlign: TextAlign.justify,
              ),
            ),

            Card(
              color: Colors.teal,
              elevation: 6,
              child: Container(
                height: 50,
                width: double.infinity,
                child: Center(
                  child: Text("Basic kit description", 
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
              child: Text("There is a place for the Arduino UNO controller in the top left-hand corner of the board. In the bottom left-hand corner there is a section with displays (LCD and OLED) and with LEDs. To the right of the display there are 5 large monostable buttons.",
              textAlign: TextAlign.justify,
              ),
            ),

            Image.asset("assets/images/ard.jpg"),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Text("On the right-hand side there is an IR receiver, a potentiometer, light sensor, buzzer, temperature sensor, microphone and a 7-segment display with a pin expander. In the upper, middle part of the board, you can find a connector for external power, a set of jumpers to reconfigure the connections and place for a Bluetooth module and any additional shield with other accessories.",
              textAlign: TextAlign.justify,
              ),
            ),

            Card(
              color: Colors.teal,
              elevation: 6,
              child: Container(
                height: 50,
                width: double.infinity,
                child: Center(
                  child: Text("List of available peripherals", 
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
              child: Text("The following peripherals are connected to the Arduino UNO:",
              textAlign: TextAlign.justify,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric( horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(" * Simple, single-colour LED (D13).",
                  textAlign: TextAlign.left,
                  ),
                  Text(" * Simple, three-colour (RGB) LED ( D9 - D11).",
                  textAlign: TextAlign.left,
                  ),
                  Text(" * 7-SEG display ",
                  textAlign: TextAlign.left,
                  ),
                  Text(" * 5 Addresable LED ",
                  textAlign: TextAlign.left,
                  ),
                  Text(" * Keyboard with 5 monostable buttons",
                  textAlign: TextAlign.left,
                  ),
                  Text(" * Potentiometer ",
                  textAlign: TextAlign.left,
                  ),
                  Text(" * Temprature sensor ",
                  textAlign: TextAlign.left,
                  ),
                  Text(" * Light dependent resistor ",
                  textAlign: TextAlign.left,
                  ),
                  Text(" * Sound sensor (microphone) ",
                  textAlign: TextAlign.left,
                  ),
                  Text(" * LCD display ",
                  textAlign: TextAlign.left,
                  ),

                  Text(" * OLED Display ",
                  textAlign: TextAlign.left,
                  ),
                  Text(" * Bluetooth module ",
                  textAlign: TextAlign.left,
                  ),

                ],
              ),
            ),

            Card(
              color: Colors.teal,
              elevation: 6,
              child: Container(
                height: 50,
                width: double.infinity,
                child: Center(
                  child: Text("Safety information", 
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
              child: Text("When operating the device, avoid direct contact with the PCB (touching electronic components and paths), because in extreme situations it may damage the board. The exception are 7 buttons and a potentiometer, which can be used in programmes loaded onto the board.",
              textAlign: TextAlign.justify,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Text("Any changes to the configuration of jumpers and connecting additional modules should be performed when the board is disconnected from power source!",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.red,
                fontStyle: FontStyle.italic,
                fontFamily: "Quicksand"
              ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Text("Before turning on the board, it is also worth making sure that the plate was not accidentally placed on metal objects (e.g. on a screwdriver), which could close the signals flowing under the plate.",
              textAlign: TextAlign.justify,
              ),
            ),

            Card(
              color: Colors.teal,
              elevation: 6,
              child: Container(
                height: 50,
                width: double.infinity,
                child: Center(
                  child: Text("Necessary software", 
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
              child: Text("For programming the board you need the Arduino IDE environment, which can be downloaded for free from the project website, i.e.: https://arduino.cc. From the page navigation menu, select the \"SOFTWARE\" tab. On the newly opened page, go to the \"Download the Arduino IDE\" section and select the appropriate version for the given system from the list on the right. Then you will be asked for voluntary financial support for the project. At this stage, you can donate or download the software for free by selecting the \"JUST DOWNLOAD\" button. At this point, the installer will start downloading.",
              textAlign: TextAlign.justify,
              ),
            ),

            Card(
              color: Colors.teal,
              elevation: 6,
              child: Container(
                height: 50,
                width: double.infinity,
                child: Center(
                  child: Text(" --- Well Done ---", 
                  style: TextStyle(
                    fontFamily: "Quicksand", 
                    fontSize: 22,
                    color: Colors.white
                        ),
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


