import 'package:flutter/material.dart';
import 'package:tme_ard_v2/widgets/cardScrollView.dart';
import 'package:tme_ard_v2/widgets/listView.dart';

import '../app_theme.dart';


class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    
    return Container(
       child: Scaffold(
         
         backgroundColor: AppTheme.chipBackground,
         appBar: AppBar(
           title: Center(child: Text("Home Page", style: TextStyle(color: Colors.black26),),),
           backgroundColor: AppTheme.chipBackground,
           elevation: 0.0,
         ),
         body: Column(
           children: <Widget>[
             
            Spacer(),

            CardScrollView(),
            
            ListChoices(),


           ],
         ),
       ),
    );
  }
}


