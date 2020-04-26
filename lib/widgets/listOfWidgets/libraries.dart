import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tme_ard_v2/widgets/reusable/animatedContainer.dart';

class Libraries extends StatefulWidget {

  @override
  _LibrariesState createState() => _LibrariesState();
}

class _LibrariesState extends State<Libraries> {
  @override
  Widget build(BuildContext context) {
    final Size screensize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.teal[50],
      body: Stack(
        children: <Widget>[
          
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 10),
            child: Center(
              child: SingleChildScrollView(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    AnimatedContainerView(
                      tittle: "Extensible hd44780 LCD library",
                      subtittle: "library for hd44780 based LCD display",
                      author: "Bill Perry",
                      projectsite: "www.github.com/duinoWitchery/hd44780",
                      licence: "GPL",
                      ),
                    AnimatedContainerView(
                      tittle: "Adafriut_SSD1306",
                      subtittle: "library for our Monochrome OLEDs based on SSD1306 drivers",
                      author: "firma Adafruit",
                      projectsite: "www.github.com/duinoWitchery/hd44780",
                      licence: "BSD",
                      ),
                    AnimatedContainerView(
                      tittle: "Adafruit_NeoPixel",
                      subtittle: "library for controlling single-wire-based LED pixels",
                      author: "firma Adafruit",
                      projectsite: "www.github.com/adafruit/Adafruit_NeoPixel",
                      licence: "GPL",
                      ),
                    AnimatedContainerView(
                      tittle: "Arduino RC5 remote control decoder",
                      subtittle: "library for decoding infrared remote control",
                      author: "Bill Perry",
                      projectsite: "www.github.com/guyc/RC5",
                      licence: "BSD",
                      ),
                    AnimatedContainerView(
                      tittle: "Adafruit-MCP23008-library",
                      subtittle: "library for the MCP23008 I2C I/O expander",
                      author: "firma Adafruit",
                      projectsite: "www.github.com/duinoWitchery/hd44780",
                      licence: "BSD",
                      ),
                  ],
                ),
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: 20),
            width: screensize.width * 0.15,
            height: screensize.width * 0.15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(40)),
              color: Colors.teal,
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.grey,
                  spreadRadius: 1,
                  offset: Offset(1, 5)
                ),
              ]
            ),
            child: IconButton(
              onPressed: (){
                Get.back();
              }, 
              icon: Icon(Icons.arrow_back, size: 20,color: Colors.white,),
              ),
          ),


        ],
      ),
    );
  }
}