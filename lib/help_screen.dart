import 'package:tme_ard_v2/widgets/reusable/info.dart';
import 'package:url_launcher/url_launcher.dart';

import './app_theme.dart';
import 'package:flutter/material.dart';

class HelpScreen extends StatefulWidget {
  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  TextEditingController txtctr = new TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.nearlyWhite,
      child: SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: AppTheme.nearlyWhite,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            actions: [
            InfoIcon(color: Colors.teal,)
          ],),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top,
                      left: 16,
                      right: 16),
                  child: Image.asset('assets/images/helpImage.png'),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    'How can we help you?',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: const Text(
                    'It looks like you are experiencing problems\nIf your problem is regarding please contact the developer\n ad if your problem is regarding our projects or TME ARD V.2 please share it on our facebook group :)',
                    textAlign: TextAlign.center,
                    style: AppTheme.caption,
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
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Center(
                              child: Text("Offcial website",
                                  style: TextStyle(color: Colors.white))),
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
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Center(
                              child: Text(
                            "Offcial Facebook page",
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
                
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: InkWell(
                    onTap: () async {
                      const url = 'hope.miky1074@gmail.com';
                      await launch("mailto: $url");
                    },
                    child: Card(
                      color: AppTheme.nearlyBlack,
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Center(
                            child: Text("Contact the develper",
                                style: TextStyle(color: Colors.white))),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
