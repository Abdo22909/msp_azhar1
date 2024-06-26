import 'dart:io';

import 'package:auto_direction/auto_direction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart' as Intl;
import 'package:msp/models/project.dart';
import 'package:msp/pages/home.dart';
import 'package:msp/pages/tabs_screens/items_widgets/staff_item.dart';
import 'package:msp/services/webview.dart';
import 'package:msp/ui/app_theme.dart';
import 'package:url_launcher/url_launcher.dart';

//List<Widget> texts = <Widget>[];
Project _project;

class DetailedProjectScreen extends StatefulWidget {
  final Project project;

  const DetailedProjectScreen(this.project);

  @override
  _DetailedProjectScreenState createState() => _DetailedProjectScreenState();
}

class _DetailedProjectScreenState extends State<DetailedProjectScreen> {
  @override
  void initState() {
    _project = widget.project;
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
          //iconTheme: IconThemeData(color: AppTheme.nearlyWhite),
          brightness: Brightness.dark,
          title: Text(_project.title,
              style: Theme.of(context).textTheme.headline1),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: ListView(
          padding: EdgeInsets.only(bottom: 60),
          children: <Widget>[
            Container(
              height: 200,
              width: size.width,
              child: _project.image.isNotEmpty
                  ? Image.memory(
                getImageFromAPI(_project.image),
                fit: BoxFit.cover,
                alignment: Alignment.center,
              )
                  : Container(color:Theme.of(context).primaryColor),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Description:".toUpperCase(),
                    style: Theme.of(context).textTheme.headline3
                  ),
                  SizedBox(height: 16),
                  AutoDirection(
                    text: _project.description,
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          child:  SelectableText(
                            _project.description,
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
                  SizedBox(height: 16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 130,
                        child: Text(
                          "Link:".toUpperCase(),
                          style:
                          Theme.of(context).textTheme.headline3,
                        ),
                      ),
                      Flexible(
                        child: InkWell(
                          onTap: () =>Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => WebViewScreen(
                                      url: _project.projectLink))
                          ),
                          child: Text(
                            _project.projectLink,
                            style: TextStyle(
                                color: AppTheme.nearlyBlue2,
                                decoration: TextDecoration.underline,
                                decorationThickness: 0.3),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  _project.staff.isNotEmpty
                      ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Staff".toUpperCase(),
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      SizedBox(height: 8),
                      Container(
                        height: 240,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _project.staff.length,
                          itemBuilder: (BuildContext context, int index) {
                            return StaffItem(_project.staff[index]);
                          },
                        ),
                      ),
                    ],
                  )
                      : Container()
                ],
              ),
            )
          ],
        ));
  }
}

getDateTime(String date, String time) {
  return Intl.DateFormat("dd/MM/yyyy - hh:mm a").format(
    DateTime.parse("$date $time"),
  );
}

launchURL(String url) async {
  String mUrl = url;
  if (await canLaunch(mUrl)) {
    await launch(mUrl);
  } else {
    throw 'Could not launch $mUrl';
  }
}
