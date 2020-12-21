import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/androidstudio.dart';
import 'package:flutter_highlight/themes/arduino-light.dart';
import 'package:tme_ard_v2/widgets/reusable/projectCodes.dart';

class CodeView extends StatefulWidget {
  final project;
  CodeView({this.project});
  @override
  _CodeViewState createState() => _CodeViewState();
}

class _CodeViewState extends State<CodeView>
    with SingleTickerProviderStateMixin {
  bool darktheme = false;
  var theme = arduinoLightTheme;
  TabController _tabController;
  int selectedindex = 0;

  @override
  void initState() {
    _tabController =
        TabController(length: widget.project["code"].length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.project["tittle"]),
        actions: [
          Switch(
              value: darktheme,
              activeColor: Colors.black54,
              onChanged: (value) {
                setState(() {
                  darktheme = value;
                  value == true
                      ? theme = androidstudioTheme
                      : theme = arduinoLightTheme;
                });
              })
        ],
        bottom: TabBar(
          unselectedLabelColor: Colors.white,
          labelColor: Colors.amber,
          onTap: (idx) {
            setState(() {
              selectedindex = idx;
            });
          },
          tabs: [
            for (var element in widget.project["code"])
              Tab(
                child: Text(element["name"], style: TextStyle(fontSize: 12),),
              ),
          ],
          controller: _tabController,
          indicatorColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
        bottomOpacity: 1,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: screen.width,
          child: HighlightView(
            widget.project["code"][selectedindex]["code"],
            language: 'arduino',
            theme: theme,
            padding: EdgeInsets.all(12),
            textStyle: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
