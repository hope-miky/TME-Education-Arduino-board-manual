import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../app_theme.dart';

class AnimatedContainerView extends StatefulWidget {

  final String tittle;
  final String subtittle;
  final String projectsite;
  final String author;
  final String licence;

  AnimatedContainerView({this.author, this.projectsite, this.subtittle, this.tittle, this.licence}){}
  
  @override
  _AnimatedContainerViewState createState() => _AnimatedContainerViewState();
}

class _AnimatedContainerViewState extends State<AnimatedContainerView> {
  bool selected = true;
  
  //String site = widget.projectsite;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical:8.0),
          child: GestureDetector(
            onTap: () {
              setState(() {
                      selected = !selected;
                      });
            },
            child: AnimatedContainer(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: selected ? Colors.indigo[100] : Colors.teal[100],
              ),
              curve: !selected ? ElasticOutCurve(.9) : Curves.elasticOut,
              width: 200.0,
              height: selected ? 60.0 : 200.0,
              
              alignment: selected ? Alignment.center : AlignmentDirectional.topCenter,
              duration: selected ? Duration(seconds: 3): Duration(seconds: 1),
              child: !selected ? SingleChildScrollView(
                        child: Column(  
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.teal),
                          
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(widget.tittle, textAlign: TextAlign.center, style: AppTheme.body1.copyWith(
                            fontSize: 18,
                            
                          ),),
                        ),
                      ),
                    ),
                    Text("${widget.subtittle}"),
                    Text("Author - ${widget.author}"),
                    Text("Licence - ${widget.licence}"),
                    FlatButton(
                      onPressed: ()async {
                      var url = '${widget.projectsite}';
                      if (await canLaunch(url)) {
                        await launch(url, forceSafariVC: false);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                      child: Text("Visit offcial site", style: TextStyle(color: Colors.teal[900]),),
                      
                      )

                  ],
                ),
              ) : Column(
                children: <Widget>[
                  Spacer(),
                  Text(widget.tittle, style: AppTheme.body1,),
                  Spacer(),
                ],
              ),
            ),
          ),
        )
      );
  }
}