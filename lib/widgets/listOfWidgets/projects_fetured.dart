import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../app_theme.dart';

class ProjectsFetured extends StatelessWidget {

  final List<Map<String, dynamic>> listofProjects;

  ProjectsFetured({this.listofProjects});


  @override
  Widget build(BuildContext context) {
    return Container(
            height: MediaQuery.of(context).size.height * 0.4,
            child: Column(
              
              children: <Widget>[
                
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                    child: Column(
                      
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),


                        Container(
                          margin: EdgeInsets.only(left: 15),
                          child: Text("Fetured",
                          textAlign: TextAlign.left, 
                          style: AppTheme.caption.copyWith(
                            fontSize: 15,
                            color: Colors.teal
                          ),),
                        ),

                        
                        SizedBox(
                          height: 10,
                        ),


                        Container(
                          height: MediaQuery.of(context).size.height * 0.30,

                          child: GridView.count(
                            crossAxisCount: 1,
                            scrollDirection: Axis.horizontal,
                            crossAxisSpacing: 100,
                            mainAxisSpacing: 20,
                            childAspectRatio: 0.6,
                            shrinkWrap: true,
                            //padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.15),
                          
                            

                            children: listofProjects.where((test) => test["fetured"]).map( (f) {
                              return Container(
                                child: Container(
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.all(Radius.circular(20)),
                                   color: Colors.teal[50],
                                   border: Border.all(color: Colors.teal[300])
                                 ),
                                  child: Row(

                                    children: <Widget>[
                                      
                                      Container(
                                        width: MediaQuery.of(context).size.width * 0.4,
                                        height: double.maxFinite,
                                        child: ClipRRect(
                                         borderRadius: BorderRadius.all(Radius.circular(20)),
                                         child: Image.asset(f["imagepath"],
                                           fit: BoxFit.cover,
                                         ),
                                          ),
                                      ),

                                      Flexible(
                                          child: Container(
                                          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[

                                              Text(f["tittle"],
                                              style: AppTheme.title.copyWith(
                                                      color: Colors.teal,
                                                      fontWeight: FontWeight.normal,

                                                    ),
                                                ),

                                                Text("By -" +f["by"],
                                                      textAlign: TextAlign.left,
                                                      style: AppTheme.caption.copyWith(
                                                      fontWeight: FontWeight.normal
                                                    ),
                                                ),

                                                Padding(
                                                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                                                  child: Text(f["subtittle"],
                                                        textAlign: TextAlign.left,
                                                        style: AppTheme.subtitle.copyWith(
                                                          color: Colors.brown,
                                                        fontWeight: FontWeight.normal,
                                                        fontSize: 13
                                                      ),
                                                  ),
                                                ),

                                                Spacer(),

                                                Flexible(
                                                  child: FlatButton(
      
                                                    onPressed: ()async {
                                                          var url = '${f["link"]}';
                                                          if (await canLaunch(url)) {
                                                            await launch(url, forceSafariVC: false);
                                                          } else {
                                                            throw 'Could not launch $url';
                                                          }
                                                        },
                                                    child: Text("View code", style: AppTheme.caption.copyWith(
                                                      color: Colors.teal[700],
                                                      fontSize: 14
                                                    ),)
                                                    ),
                                                )

                                                


                                            ],
                                          ),
                                        ),
                                      ),


                                    ],
                                  ),
                                ),
                              );
                            } ).toList()
                            
                            
                            
                            ),
                        ),
                      
   
                      ],
                  ),
                ),
              ],
            ),
          );
  }
}