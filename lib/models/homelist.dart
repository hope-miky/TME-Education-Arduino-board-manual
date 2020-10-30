import 'package:flutter/widgets.dart';
import 'package:tme_ard_v2/help_screen.dart';
import 'package:tme_ard_v2/widgets/Planning/PlannedtripsList.dart';
import 'package:tme_ard_v2/widgets/listOfWidgets/IntroToTME.dart';
import 'package:tme_ard_v2/widgets/listOfWidgets/coddingIntro.dart';
import 'package:tme_ard_v2/widgets/listOfWidgets/componentsView.dart';
import 'package:tme_ard_v2/widgets/listOfWidgets/libraries.dart';
import 'package:tme_ard_v2/widgets/listOfWidgets/newIntro.dart';
import 'package:tme_ard_v2/widgets/listOfWidgets/projects.dart';

class HomeList {
  HomeList({this.navigateScreen, this.imagePath = '', this.tittle});

  Widget navigateScreen;
  String imagePath;
  String tittle;

  static List<HomeList> homeList = [
    HomeList(
        imagePath: 'assets/images/introduction.png',
        navigateScreen: FlightsStepper(),
        // navigateScreen: IntroToTME(),
        tittle: "Introduction"),
    HomeList(
        imagePath: 'assets/images/list.png',
        navigateScreen: CardScrollView(),
        tittle: "Components"),
    HomeList(
        imagePath: 'assets/images/programming.png',
        navigateScreen: CoddingIntro(),
        tittle: "Codding intro"),
    HomeList(
        imagePath: 'assets/images/feedbackImage.png',
        navigateScreen: PlannedTripsList(),
        tittle: "Planned Trips"),
    HomeList(
        imagePath: 'assets/images/projects.png',
        navigateScreen: ProjectsView(),
        tittle: "Projects"),
    HomeList(
        imagePath: 'assets/images/libraries.png',
        navigateScreen: Libraries(),
        tittle: "Libraries"),
    HomeList(
        imagePath: 'assets/images/helpImage.png',
        navigateScreen: HelpScreen(),
        tittle: "Help"),
  ];
}
