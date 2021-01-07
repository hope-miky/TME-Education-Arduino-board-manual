import 'package:flutter/material.dart';

class InfoIcon extends StatelessWidget {
  final color;
  InfoIcon({this.color});
  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: color,
      onPressed: () {
        showAboutDialog(
            context: context,
            applicationName: "TME Education Arduino board manual",
            applicationVersion: "2.0",
            applicationIcon: Container(
                width: 50,
                height: 50,
                child: Image.asset('assets/images/ard.jpg')));
      },
      icon: Icon(Icons.info_outline),
    );
  }
}
