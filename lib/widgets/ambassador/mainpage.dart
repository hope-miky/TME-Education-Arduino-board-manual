import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tme_ard_v2/app_theme.dart';
import 'package:tme_ard_v2/widgets/ambassador/adminPlannedLists.dart';
import 'package:tme_ard_v2/widgets/ambassador/registeredUsersList.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'addplan.dart';

class AmbassadorDashboard extends StatefulWidget {
  AmbassadorDashboard();

  @override
  _AmbassadorDashboardState createState() => _AmbassadorDashboardState();
}

class _AmbassadorDashboardState extends State<AmbassadorDashboard> {
  var users = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser.email.toString());
  int index = 0;
  FirebaseAuth auth;
  var user = FirebaseAuth.instance.currentUser;
  PageController _pageController;
  void showLoginDialog(screen) async {
    await showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      pageBuilder: (_, __, ___) {
        return Align(
          alignment: Alignment.center,
          child: AddPlan(
            screen: screen,
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
          child: child,
        );
      },
    ).then((value) {});
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            user != null
                ? "Admin console (" + user.email + ")"
                : "Admin console",
            style: AppTheme.caption.copyWith(color: Colors.teal, fontSize: 15),
          ),
          elevation: 0,
          backgroundColor: Colors.white10,
        ),
        body: SizedBox.expand(
          child: PageView(
            controller: _pageController,
            onPageChanged: (idx) {
              setState(() => index = idx);
            },
            children: <Widget>[
              Container(
                color: Colors.blueGrey,
              ),
              Container(
                color: Colors.red,
              ),
              RegisteredUsersList(),
              AdminPlannedList(),
              Container(
                color: Colors.blue,
                child: StreamBuilder<DocumentSnapshot>(
                  stream: users.snapshots(includeMetadataChanges: true),
                  builder: (BuildContext context,
                      AsyncSnapshot<DocumentSnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something went wrong');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                          Text("Loading"),
                        ],
                      ));
                    }

                    return Text(snapshot.data["fullname"]);
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
        floatingActionButton: FloatingActionButton(
          mini: true,
          onPressed: () => showLoginDialog(screen),
          child: Icon(Icons.add),
        ),
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: index,
          showElevation: true, // use this to remove appBar's elevation
          onItemSelected: (index) => setState(() {
            index = index;
            _pageController.animateToPage(index,
                duration: Duration(milliseconds: 300), curve: Curves.ease);
          }),
          items: [
            BottomNavyBarItem(
              icon: Icon(Icons.apps),
              title: Text('Home'),
              activeColor: Colors.red,
            ),
            BottomNavyBarItem(
                icon: Icon(Icons.message),
                title: Text('Messages'),
                activeColor: Colors.pink),
            BottomNavyBarItem(
                icon: Icon(Icons.people),
                title: Text('Students'),
                activeColor: Colors.purpleAccent),
            BottomNavyBarItem(
                icon: Icon(Icons.list),
                title: Text('Trips'),
                activeColor: Colors.amber[900]),
            BottomNavyBarItem(
                icon: Icon(Icons.settings),
                title: Text('Settings'),
                activeColor: Colors.blue),
          ],
        ));
  }
}
