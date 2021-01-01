import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/androidstudio.dart';
import 'package:flutter_highlight/themes/arduino-light.dart';

class CodeView extends StatefulWidget {
  final project;
  CodeView({this.project});
  @override
  _CodeViewState createState() => _CodeViewState();
}

class _CodeViewState extends State<CodeView>
    with SingleTickerProviderStateMixin {
  bool darktheme = false;
  bool checked = false;
  var theme = arduinoLightTheme;
  TabController _tabController;
  int selectedindex = 0;
  String _responseFromNativeCode = null;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  static const platform = const MethodChannel('flutter.native/helper');

  @override
  void initState() {
    _tabController =
        TabController(length: widget.project["code"].length, vsync: this);
    super.initState();
    platform.setMethodCallHandler(_platformCallHandler);
  }

  Future<dynamic> _platformCallHandler(MethodCall call) async {
    switch (call.method) {
      case 'callMe':
        print('call callMe : arguments = ${call.arguments}');
        setState(() {
          _responseFromNativeCode = call.arguments.toString();
        });
        return Future.value('called from platform!');
      //return Future.error('error message!!');
      default:
        print('Unknowm method ${call.method}');
        throw MissingPluginException();
        break;
    }
  }

  Future<void> requestPermission() async {
    String response = "";
    try {
      final String result = await platform.invokeMethod('requestPermission');
      response = result;
      showInSnackBar(
          "You are successfully connected to: " + response, Colors.green);
      setState(() {
        checked = true;
      });
    } on PlatformException catch (e) {
      response = "Failed to reqest permission.";
      showInSnackBar("Failed to connected: ", Colors.red);
    }
    setState(() {
      _responseFromNativeCode = response;
    });
  }

  Future<void> uploadToBoard() async {
    showInSnackBar(
          "Uploading to board...... ", Colors.green);
    String response = "";
    try {
      final String result = await platform
          .invokeMethod('uploadToBoard', {"filename": widget.project["hex"]});
      response = result;
    } on PlatformException catch (e) {
      response = "Failed to to upload: ";
      showInSnackBar(
          response, Colors.red);
    }
    setState(() {
      _responseFromNativeCode = response;
    });
  }

  void showInSnackBar(String value, Color color) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(value),
      backgroundColor: color,
    ));
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_return,
            color: Colors.teal,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          widget.project["tittle"],
          style: TextStyle(color: Colors.teal),
        ),
        actions: [
          FlatButton.icon(
            icon: checked
                ? Icon(
                    Icons.check_circle_outline_outlined,
                    color: Colors.green,
                  )
                : Icon(
                    Icons.hardware,
                    color: Colors.red,
                  ),
            label: checked
                ? Text(
                    "Connected!",
                    style: TextStyle(color: Colors.green),
                  )
                : Text("Check permission", style: TextStyle(color: Colors.red)),
            onPressed: requestPermission,
          ),
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
          unselectedLabelColor: Colors.teal,
          labelColor: Colors.amber[900],
          onTap: (idx) {
            setState(() {
              selectedindex = idx;
            });
          },
          tabs: [
            for (var element in widget.project["code"])
              Tab(
                child: Text(
                  element["name"],
                  style: TextStyle(fontSize: 12),
                ),
              ),
          ],
          controller: _tabController,
          indicatorColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
        bottomOpacity: 1,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(_responseFromNativeCode),
            Container(
              width: screen.width,
              child: HighlightView(
                widget.project["code"][selectedindex]["code"],
                language: 'arduino',
                theme: theme,
                padding: EdgeInsets.all(12),
                textStyle: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        mini: true,
        onPressed: checked ? uploadToBoard : null,
      ),
    );
  }
}
