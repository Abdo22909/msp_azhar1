import'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:msp/services/webview.dart';

class Slides extends StatefulWidget {
  @override
  _SlidesState createState() => _SlidesState();
}

class _SlidesState extends State<Slides> {
  @override
  Widget build(BuildContext context) {
    return 
      Container(
        decoration: BoxDecoration(
          color: Color(0xFF333350),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          )
        ),

        height: 400,
        child: SingleChildScrollView(
          child: Column (
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Text('Update developers',style: TextStyle(
                color: Colors.white,
                fontSize: 18
              ),),
              SizedBox(
                height: 20,
              ),
              new Stack(
                children: <Widget>[
                  Container(
                    height: 124.0,
                    margin: new EdgeInsets.only(left: 46.0),
                    decoration: new BoxDecoration(
                      color: new Color(0xFF333366),
                      shape: BoxShape.rectangle,
                      borderRadius: new BorderRadius.circular(8.0),
                      boxShadow: <BoxShadow>[
                        new BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10.0,
                          offset: new Offset(0.0, 10.0),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      margin: new EdgeInsets.symmetric(
                          vertical: 16.0
                      ),
                      alignment: FractionalOffset.centerLeft,
                      child:  CircleAvatar(
                        backgroundImage:AssetImage("assets/images/updatedev/mina.jpg"),
                        radius: 46,
                      )
                  ),
                  Container(
                      margin: new EdgeInsets.symmetric(
                          vertical: 16.0
                      ),
                      alignment: FractionalOffset.topCenter,
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30,top: 10,bottom: 15),
                          child: Text('Mina Mamdouh Mehreb',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:18,bottom: 10),
                          child: Text('Computer Science ',style: TextStyle(color: Colors.white,fontSize: 14),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25,bottom: 10),
                          child: Text('Mobile Application Development',style: TextStyle(color: Colors.white,fontSize: 14),),
                        )
                      ],)
                  ),
                  Container(
                      margin: new EdgeInsets.symmetric(
                          vertical: 16.0
                      ),
                      alignment: FractionalOffset.topRight,
                      child: PopupMenuButton(
                        color:  Color(0xFF333366),
                        onSelected: (y){
                          if(y==0){
                            setState(() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => WebViewScreen(
                                          url:
                                          "https://www.facebook.com/profile.php?id=100007951875908")));
                            });
                          }
                          if(y==1){
                            setState(() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => WebViewScreen(
                                          url:
                                          "https://github.com/Mina-Mamdouh0")));
                            });
                          }
                          if(y==2){
                            setState(() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => WebViewScreen(
                                          url:
                                          "https://www.linkedin.com/in/mina-mamdouh-moharab")));
                            });
                          }
                        },
                        itemBuilder: (y){
                          return[
                            PopupMenuItem(
                              child: ListTile(title: Text('FaceBook'),leading:Icon( FontAwesomeIcons.facebook),),value: 0,
                            ),
                            PopupMenuItem(
                              child: ListTile(title: Text('Github'),leading:Icon( FontAwesomeIcons.github),),value: 1,
                            ),
                            PopupMenuItem(
                              child: ListTile(title: Text('Linkedin'),leading:Icon( FontAwesomeIcons.linkedin),),value: 2,
                            ),];
                        },
                      )
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              new Stack(
                children: <Widget>[
                  Container(
                    height: 124.0,
                    margin: new EdgeInsets.only(left: 46.0),
                    decoration: new BoxDecoration(
                      color: new Color(0xFF333366),
                      shape: BoxShape.rectangle,
                      borderRadius: new BorderRadius.circular(8.0),
                      boxShadow: <BoxShadow>[
                        new BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10.0,
                          offset: new Offset(0.0, 10.0),
                        ),
                      ],
                    ),
                  ),
                  Container(

                      margin: new EdgeInsets.symmetric(
                          vertical: 16.0
                      ),
                      alignment: FractionalOffset.centerLeft,
                      child:
                      CircleAvatar(
                        backgroundImage:AssetImage("assets/images/updatedev/abdo.jpg"),
                        radius: 46,
                      )
                  ),
                  Container(
                      margin: new EdgeInsets.symmetric(
                          vertical: 16.0
                      ),
                      alignment: FractionalOffset.topCenter,
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30,top: 10,bottom: 15),
                          child: Text('Abdelrhman Mohamed ',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25,bottom: 10),
                          child: Text('Faculty of commerce, Al-Azhar',style: TextStyle(color: Colors.white,fontSize: 14),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25,bottom: 10),
                          child: Text('Mobile Application Development',style: TextStyle(color: Colors.white,fontSize: 14),),
                        )
                      ],)
                  ),
                  Container(
                      margin: new EdgeInsets.symmetric(
                          vertical: 16.0
                      ),
                      alignment: FractionalOffset.topRight,
                      child: PopupMenuButton(
                        color:  Color(0xFF333366),
                        onSelected: (y){
                          if(y==0){
                            setState(() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => WebViewScreen(
                                        url:
                                        "https://www.facebook.com/profile.php?id=100008753052151")));
                            });}
                          if(y==1){
                            setState(() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => WebViewScreen(
                                          url:
                                          "https://github.com/Abdo22909")));
                            });
                          }
                          if(y==2){
                            setState(() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => WebViewScreen(
                                          url:
                                          "https://www.linkedin.com/in/abdelrahman-mohamed-91322717a")));
                            });
                          }
                        },
                        itemBuilder: (y){
                          return[
                            PopupMenuItem(
                              child: ListTile(title: Text('FaceBook'),leading:Icon( FontAwesomeIcons.facebook),),value: 0,
                            ),
                            PopupMenuItem(
                              child: ListTile(title: Text('Github'),leading:Icon( FontAwesomeIcons.github),),value: 1,
                            ),
                            PopupMenuItem(
                              child: ListTile(title: Text('Linkedin'),leading:Icon( FontAwesomeIcons.linkedin),),value: 2,
                            ),];
                        },
                      )
                  ),
                ],
              ),
            ],
          ),
        ),
      );
  }
}