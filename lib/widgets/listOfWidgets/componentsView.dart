import 'package:flutter/material.dart';
import 'package:tme_ard_v2/app_theme.dart';
import 'package:tme_ard_v2/widgets/listOfWidgets/componentsTextView.dart';

class CardScrollView extends StatefulWidget {
  CardScrollView({Key key}) : super(key: key);

  @override
  _CardScrollViewState createState() => _CardScrollViewState();
}

class _CardScrollViewState extends State<CardScrollView> {

  int _index = 2;

  final List<String> tittle = [
    "7 Seg display", 
    "Addesable LED", 
    "Arduino UNO", 
    "Bluetooth Module",
    "Push Buttons",
    "Buzzer",
    "LCD Display",
    "LED",
    "LDR",
    "Mic",
    "OLED display",
    "Potentiometer",
    "RGB LED",
    "Temprature sensor",
    ];

  final List<String> images = [
    'assets/images/comp/7seg.png',
    'assets/images/comp/adled.png',
    'assets/images/comp/ard2.png',
    'assets/images/comp/blue.png',
    'assets/images/comp/btn.png',
    'assets/images/comp/buzzer.png',
    'assets/images/comp/lcd.png',
    'assets/images/comp/led.png',
    'assets/images/comp/light.png',
    'assets/images/comp/mic.png',
    'assets/images/comp/oled.png',
    'assets/images/comp/pot.png',
    'assets/images/comp/rgbled.png',
    'assets/images/comp/temp.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Spacer(),
            Text("List of available peripherals"),
            Spacer(),
          ],
        ),
      ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                        margin: EdgeInsets.only(top: 40, bottom: 10),
                        child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.3, 
                            child: PageView.builder(
                              itemCount: 14,
                              controller: PageController(viewportFraction: 0.6),
                              onPageChanged: (int index) => setState(() => _index = index),
                              itemBuilder: (_, i) {
                                return Transform.scale(
                                  scale: i == _index ? 1 : 0.7,
                                  child: Card(
                                    elevation: 8,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                    child: Stack(
                                      children: <Widget>[
                                        Container(
                                          height: double.maxFinite,
                                          width: double.maxFinite,
                                          child: ClipRRect(
                                            child: Image.asset(images[i],fit: BoxFit.fill),
                                            borderRadius: BorderRadius.all(Radius.circular(20)),
                                            ),
                                          
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(20)
                                            ),
                                          ),
                                           Stack(
                                             children: <Widget>[

                                               Opacity(
                                                    opacity: 0.6,
                                                      child: Column(
                                                      children: <Widget>[
                                                        Spacer(),
                                                        Container(
                                                          height: 50,
                                                          decoration: BoxDecoration(    
                                                            color: Colors.black,
                                                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
                                                          ),
                                                          
                                                          
                                                        ),
                                                      ],
                                                    ),
                                                  ),

                                            Column(
                                                  children: <Widget>[
                                                    Spacer(),
                                                    Container(
                                                      padding: EdgeInsets.only(left: 35,right: 10),
                                                      height: 50,
                                                      decoration: BoxDecoration(    
                                                        color: Colors.transparent,
                                                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
                                                      ),
                                                      child: Center(
                                                        child: Text("${tittle[_index]}", 
                                                          style: AppTheme.caption.copyWith(
                                                            color: Colors.white,
                                                            fontSize: 15
                                                          ),

                                                          ),
                                                      ),
                                                    ),
                                                  ],
                                                ),



                                             ],
                                           ),
                                        
                                      ],
                                    )
                                  ),
                                );
                              },
                            ),
                          ),
                      ),

                
                ComponentsTextView(id: _index),
              ],
            ),
          ),
    );
  }
}