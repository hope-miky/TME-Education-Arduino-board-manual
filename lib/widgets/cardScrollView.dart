import 'package:flutter/material.dart';

class CardScrollView extends StatefulWidget {
  CardScrollView({Key key}) : super(key: key);

  @override
  _CardScrollViewState createState() => _CardScrollViewState();
}

class _CardScrollViewState extends State<CardScrollView> {

  int _index = 2;

  final List<String> images = [
    'assets/images/supportIcon.png',
    'assets/images/helpImage.png',
    'assets/images/feedbackImage.png',
    'assets/images/helpImage.png',
    'assets/images/inviteImage.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
                margin: EdgeInsets.only(top: 40, bottom: 10),
                child: SizedBox(
                    height: 200, // card height
                    child: PageView.builder(
                      itemCount: 5,
                      controller: PageController(viewportFraction: 0.7),
                      onPageChanged: (int index) => setState(() => _index = index),
                      itemBuilder: (_, i) {
                        return Transform.scale(
                          scale: i == _index ? 1 : 0.8,
                          child: Card(
                            elevation: 8,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            child: Stack(
                              children: <Widget>[
                                Center(
                                  child: Container(
                                    child: Image.asset(images[i],fit: BoxFit.fill),
                                    margin: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20)
                                      ),
                                    ),
                                ),
                                   Stack(
                                     children: <Widget>[

                                       Opacity(
                                            opacity: 0.5,
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
                                              child: Row(
                                                children: <Widget>[
                                                  Text("Tittle $_index", 
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontFamily: 'Roboto'
                                                      ),

                                                    ),

                                                    Spacer(),

                                                  IconButton(
                                                    icon: Icon(Icons.link), 
                                                    onPressed: () {},
                                                    color: Colors.white,
                                                    ),


                                                ],
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
              );
  }
}