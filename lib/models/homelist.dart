
import 'package:flutter/widgets.dart';
import 'package:tme_ard_v2/widgets/listOfWidgets/IntroToTME.dart';
import 'package:tme_ard_v2/widgets/listOfWidgets/componentsList.dart';

class HomeList {
  HomeList({
    this.navigateScreen,
    this.imagePath = '',
    this.tittle
  });

  Widget navigateScreen;
  String imagePath;
  String tittle;

  static List<HomeList> homeList = [
    HomeList(
      imagePath: 'assets/images/introduction.png',
      navigateScreen: IntroToTME(),
      tittle: "Introduction"
    ),
    HomeList(
      imagePath: 'assets/images/list.png',
      navigateScreen: ComponentList(),
      tittle: "Components"
    ),

    HomeList(
      imagePath: 'assets/images/programming.png',
      navigateScreen: ComponentList(),
      tittle: "Codding intro"
    ),

    HomeList(
      imagePath: 'assets/images/projects.png',
      navigateScreen: ComponentList(),
      tittle: "Projects"
    ),

    HomeList(
      imagePath: 'assets/images/libraries.png',
      navigateScreen: ComponentList(),
      tittle: "Libraries"
    ),

    HomeList(
      imagePath: 'assets/images/helpImage.png',
      navigateScreen: ComponentList(),
      tittle: "Help"
    ),

    

    
   
  ];
}
