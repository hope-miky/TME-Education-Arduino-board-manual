import 'package:flutter/material.dart';

class ListChoices extends StatelessWidget {
  const ListChoices({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screeensize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      height: screeensize.height / 1.95,
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {

          return Column(
            children: <Widget>[

              Container(
                 margin: EdgeInsets.symmetric(vertical: 5),
                child: InkWell(
                  onTap: (){},
                  child: Card(
                    color: Colors.teal,
                  elevation: 5,
                    child: Container(
                      width: double.infinity,
                      child: ListTile(
                        title: Text("Introduction to TME Education", style: TextStyle(color: Colors.white),),
                        //trailing: Text("data"),
                        subtitle: Text("data",style: TextStyle(color: Colors.white)),
                        leading: Icon(Icons.info_outline , color: Colors.white,),
                      )
                      ),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),

              Container(
                 margin: EdgeInsets.symmetric(vertical: 5),
                child: InkWell(
                  onTap: (){},
                  child: Card(
                    color: Colors.teal,
                  elevation: 5,
                    child: Container(
                      width: double.infinity,
                      child: ListTile(
                        title: Text("TME ARS V.2 overview", style: TextStyle(color: Colors.white),),
                        //trailing: Text("data"),
                        subtitle: Text("data",style: TextStyle(color: Colors.white)),
                        leading: Icon(Icons.info_outline , color: Colors.white,),
                      )
                      ),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),

              Container(
                 margin: EdgeInsets.symmetric(vertical: 5),
                child: InkWell(
                  onTap: (){},
                  child: Card(
                    color: Colors.teal,
                  elevation: 5,
                    child: Container(
                      width: double.infinity,
                      child: ListTile(
                        title: Text("Components included", style: TextStyle(color: Colors.white),),
                        //trailing: Text("data"),
                        subtitle: Text("data",style: TextStyle(color: Colors.white)),
                        leading: Icon(Icons.info_outline , color: Colors.white,),
                      )
                      ),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),

              Container(
                 margin: EdgeInsets.symmetric(vertical: 5),
                child: InkWell(
                  onTap: (){},
                  child: Card(
                    color: Colors.teal,
                  elevation: 5,
                    child: Container(
                      width: double.infinity,
                      child: ListTile(
                        title: Text("Intro to Arduino programming", style: TextStyle(color: Colors.white),),
                        //trailing: Text("data"),
                        subtitle: Text("data",style: TextStyle(color: Colors.white)),
                        leading: Icon(Icons.info_outline , color: Colors.white,),
                      )
                      ),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),

              Container(
                 margin: EdgeInsets.symmetric(vertical: 5),
                child: InkWell(
                  onTap: (){},
                  child: Card(
                    color: Colors.teal,
                  elevation: 5,
                    child: Container(
                      width: double.infinity,
                      child: ListTile(
                        title: Text("Sensors", style: TextStyle(color: Colors.white),),
                        //trailing: Text("data"),
                        subtitle: Text("data",style: TextStyle(color: Colors.white)),
                        leading: Icon(Icons.info_outline , color: Colors.white,),
                      )
                      ),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),

              Container(
                 margin: EdgeInsets.symmetric(vertical: 5),
                child: InkWell(
                  onTap: (){},
                  child: Card(
                    color: Colors.teal,
                  elevation: 5,
                    child: Container(
                      width: double.infinity,
                      child: ListTile(
                        title: Text("Displays", style: TextStyle(color: Colors.white),),
                        //trailing: Text("data"),
                        subtitle: Text("data",style: TextStyle(color: Colors.white)),
                        leading: Icon(Icons.info_outline , color: Colors.white,),
                      )
                      ),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),



            ],
          );
        },
        
        ),
    );
  }
}

