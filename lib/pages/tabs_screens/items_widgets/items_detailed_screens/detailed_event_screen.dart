import 'dart:io';

import 'package:auto_direction/auto_direction.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart' as Intl;
import 'package:msp/models/event.dart';
import 'package:msp/pages/home.dart';
import 'package:msp/pages/tabs_screens/items_widgets/topic_item.dart';
import 'package:msp/services/open_url.dart';
import 'package:msp/services/webview.dart';

//List<Widget> texts = <Widget>[];
Event _event;

class DetailedEventScreen extends StatefulWidget {
  final Event event;
  final String location;

  const DetailedEventScreen(this.event, this.location);

  @override
  _DetailedEventScreenState createState() => _DetailedEventScreenState();
}

class _DetailedEventScreenState extends State<DetailedEventScreen> {
  @override
  void initState() {
    _event = widget.event;
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness:
      Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.grey,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor:Theme.of(context).primaryColor ,
        appBar: AppBar(
          // iconTheme: IconThemeData(
          //     color: AppTheme.nearlyWhite
          // ),
          brightness: Brightness.dark,
          elevation: 0,
          title: Text(_event.title,
              style: Theme.of(context).textTheme.bodyText1),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.blue,
          onPressed:()=>Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => WebViewScreen(
                      url: _event.formLink))),

          label: Text("Enroll Now".toUpperCase(),style: Theme.of(context).textTheme.headline3,),
        ),
        body: ListView(
          padding: EdgeInsets.only(bottom: 60),
          children: <Widget>[
            Container(
              height: 200,
              width: size.width,
              child: _event.img.isNotEmpty
                  ? Image.memory(
                getImageFromAPI(_event.img),
                fit: BoxFit.cover,
                alignment: Alignment.center,
              )
                  :Container(),
              //Container(color: AppTheme.tab1Secondary),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        width: 130,
                        child: Text(
                          "Date & Time:".toUpperCase(),
                          style:
                          Theme.of(context).textTheme.headline3,
                        ),
                      ),
                      Flexible(
                        child: Text(
                          getDateTime(_event.date, _event.time),
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 130,
                        child: Text(
                          "Location:".toUpperCase(),
                          style:
                          Theme.of(context).textTheme.headline3,
                        ),
                      ),
                      Flexible(
                        child: InkWell(
                          onTap: () => openURL(_event.location,true),
                          child: Text(
                            widget.location,
                            style: Theme.of(context).textTheme.headline2
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: <Widget>[
                      Container(
                        width: 130,
                        child: Text(
                          "Fees:".toUpperCase(),
                          style:
                          Theme.of(context).textTheme.headline3,
                        ),
                      ),
                      Flexible(
                        child: Text(
                          _event.price.contains(new RegExp('[A-Z,a-z]'))
                              ? _event.price
                              : _event.price + " EGP",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  _event.topics.isEmpty
                      ? Container()
                      : ExpandableNotifier(
                    initialExpanded: false,
                    child: ScrollOnExpand(
                      child: ExpandableTheme(
                        data: ExpandableThemeData(
                          tapHeaderToExpand: true,
                          tapBodyToCollapse: true,
                          hasIcon: true,
                        ),
                        child: ExpandablePanel(
                          header: Container(
                            height: 50,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Topics".toUpperCase(),
                                style: Theme.of(context).textTheme.headline3,
                              ),
                            ),
                          ),
                          expanded: Container(
                            height: 200,
                            child: ListView.builder(
                                itemCount: _event.topics.length,
                                itemBuilder:
                                    (BuildContext context, int index) {
                                  return TopicItem(
                                      _event.topics[index], index,);
                                }),
                          ), collapsed: null,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  ExpandableNotifier(
                    initialExpanded: true,
                    child: ScrollOnExpand(
                      child: ExpandableTheme(
                        data: ExpandableThemeData(
                          tapHeaderToExpand: true,
                          tapBodyToCollapse: true,
                          hasIcon: true,
                        ),
                        child: ExpandablePanel(
                          collapsed: null,
                          header: Container(
                            height: 50,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Description".toUpperCase(),
                                style: Theme.of(context).textTheme.headline3
                                    .apply(),
                              ),
                            ),
                          ),
                          expanded: AutoDirection(
                            text: _event.description,
                            child: Row(
                              children: <Widget>[
                                Flexible(
                                  child:
                                  SelectableText(
                                    _event.description,
                                    showCursor: true,
                                    toolbarOptions: ToolbarOptions(
                                      copy: true,selectAll: true
                                    ),
                                    style: Theme.of(context).textTheme.headline2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }

  String getDateTime(String date, String time) {
    return Intl.DateFormat("dd/MM/yyyy - hh:mm a")
        .format(DateTime.parse("$date $time"));
  }
}
