import 'package:flutter/material.dart';
import 'package:tme_ard_v2/app_theme.dart';

class SingleAMbassadorView extends StatelessWidget {
  final ambassador;
  const SingleAMbassadorView({this.ambassador});

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white12,
        elevation: 0,
        leading: IconButton(
            icon: Icon(Icons.keyboard_return_rounded, color: Colors.teal,),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Container(
        height: screen.height,
        width: screen.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: screen.height * 0.3,
                width: screen.width * 0.5,
                child: Hero(
                  tag: ambassador["name"],
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(2000),
                    child: Image.asset(ambassador["avatar"]),
                  ),
                ),
              ),
              Text(
                ambassador["name"],
                style: AppTheme.body1,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
                child: Text(
                  ambassador["desc"],
                  style: AppTheme.caption,
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
