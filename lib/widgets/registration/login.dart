import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tme_ard_v2/app_theme.dart';
import 'package:tme_ard_v2/widgets/ambassador/mainpage.dart';

class LoginPage extends StatefulWidget {
  LoginPage({this.screen});
  final screen;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FirebaseAuth auth;
  TextEditingController _emaincontroller = new TextEditingController();
  TextEditingController _passwordcontroller = new TextEditingController();
  bool loading = false;

  void setLoading(bool val) {
    setState(() {
      loading = val;
    });
  }

  void checkCheckAndLogin() async {
    if (auth.currentUser != null) {
      print(auth.currentUser.uid);
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => AmbassadorDashboard()));
    } else {
      await login();
    }
  }

  void signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  login() async {
    setState(() {
      loading = true;
    });
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _emaincontroller.text, password: _passwordcontroller.text)
          .then((userCredential) {});
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        setState(() {
          loading = false;
        });
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        setState(() {
          loading = false;
        });
      } else {
        print("************************Unknown***************");
        setState(() {
          loading = false;
        });
      }
    }
  }

  @override
  void initState() {
    auth = FirebaseAuth.instance;
    FirebaseAuth.instance.authStateChanges().listen((User user) {
      if (user == null) {
        print('============================== User is currently signed out!');
        setState(() {
          loading = false;
        });
      } else {
        print('============================ User is signed in!');
        setState(() {
          loading = false;
        });
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => AmbassadorDashboard()));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomPadding: false,
      body: Center(
        child: Container(
          height: widget.screen.height * 0.5,
          margin: EdgeInsets.only(bottom: 50, left: 12, right: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(50), bottomLeft: Radius.circular(50)),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: IconButton(
                            icon: Icon(Icons.arrow_back_ios_outlined),
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                      ),
                      SizedBox(
                        width: widget.screen.width * 0.22,
                      ),
                      Text(
                        "Log in",
                        style: AppTheme.caption.copyWith(fontSize: 22),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
                Divider(),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [
                        TextField(
                          controller: _emaincontroller,
                          decoration: InputDecoration(
                              labelText: "Email", icon: Icon(Icons.email)),
                        ),
                        TextField(
                          controller: _passwordcontroller,
                          decoration: InputDecoration(
                              labelText: "Password",
                              icon: Icon(Icons.security)),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          width: double.maxFinite,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                            color: Colors.teal[300],
                            onPressed: () async {
                              checkCheckAndLogin();
                            },
                            child: !loading
                                ? Text(
                                    "Log in",
                                    style: TextStyle(color: Colors.white),
                                  )
                                : Container(
                                    width: 15,
                                    height: 15,
                                    child: CircularProgressIndicator(
                                      backgroundColor: Colors.white,
                                    )),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 0),
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          width: double.maxFinite,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                side: BorderSide(color: Colors.teal)),
                            color: Colors.white,
                            onPressed: () async {
                              // setLoading(!loading);
                              await signOut();
                            },
                            child: Text(
                              "Sign out",
                              style: TextStyle(color: Colors.teal),
                            ),
                          ),
                        )
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
