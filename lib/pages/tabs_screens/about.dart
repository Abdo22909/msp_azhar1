import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:msp/models/committee.dart';
import 'package:msp/pages/tabs_screens/items_widgets/committee_item.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:msp/services/webview.dart';
import 'package:msp/ui/app_theme.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({
    Key key,
  }) : super(key: key);

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  double topBarOpacity = 0.0;

  List<Committee> committeesList = List.generate(cTitle.length, (i) {
    return Committee(
      id: i,
      title: cTitle[i],
      image: cImage[i],
      description: cDescription[i],
      color: cColor[i],
    );
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: getMainListViewUI(),
    );
  }

  Widget getMainListViewUI() {
    return Column(children: <Widget>[
      SizedBox(
        height: 10,
      ),
      Container(
          height: 50,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ClipOval(
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xFFbb0000), Color(0xFFFF6161)],
                        stops: [0.0, 0.75],
                      ),
                    ),
                    child: IconButton(
                        tooltip: "YouTube",
                        padding: EdgeInsets.only(right: 2),
                        color: AppTheme.nearlyWhite,
                        iconSize: 18,
                        icon: Icon(FontAwesomeIcons.youtube),
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => WebViewScreen(
                                    url:
                                        "https://www.youtube.com/channel/UCnrCvhZJDpijR61BNo0rk9Q")))),
                  ),
                ),
                SizedBox(
                  width: 8.0,
                ),
                ClipOval(
                  child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xFF3b5998), Color(0xFF75A1FF)],
                          stops: [0.0, 0.75],
                        ),
                      ),
                      child: IconButton(
                          tooltip: "Facebook",
                          padding: EdgeInsets.all(0),
                          color: AppTheme.nearlyWhite,
                          iconSize: 18,
                          icon: Icon(FontAwesomeIcons.facebookF),
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => WebViewScreen(
                                      url:
                                          "https://www.facebook.com/AlAzharTC/"))))),
                ),
                SizedBox(
                  width: 8.0,
                ),
                ClipOval(
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xFFbc2a8d), Color(0xFFFF6BD0)],
                        stops: [0.0, 0.75],
                      ),
                    ),
                    child: IconButton(
                        tooltip: "Instagram",
                        padding: EdgeInsets.all(0),
                        color: AppTheme.nearlyWhite,
                        iconSize: 20,
                        icon: Icon(FontAwesomeIcons.instagram),
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => WebViewScreen(
                                    url:
                                        "https://www.instagram.com/mspalazhar/")))),
                  ),
                ),
                SizedBox(
                  width: 8.0,
                ),
                ClipOval(
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xFF007bb6), Color(0xFF4FC7FF)],
                        stops: [0.0, 0.75],
                      ),
                    ),
                    child: IconButton(
                        tooltip: "Linkedin",
                        padding: EdgeInsets.all(0),
                        color: AppTheme.nearlyWhite,
                        iconSize: 18,
                        icon: Icon(FontAwesomeIcons.linkedinIn),
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => WebViewScreen(
                                    url:
                                        "https://www.linkedin.com/company/msp-tech-club-al-azhar-university/")))),
                  ),
                ),
              ],
            ),
          )),
      SizedBox(
        height: 16.0,
      ),
      Expanded(
        flex: 5,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('MSP Tech Club - Al Azhar University',
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.headline3),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                          "We are a student community program that promotes advanced technology through education, practice, and innovation. It also provides students with both technical and non-technical sessions needed which is packing their lives with high level of skills and supporting their careers with opportunities.",
                          style: Theme.of(context).textTheme.headline2)
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Our Mission'.toUpperCase(),
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.headline3),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                          "We have a clear mission is to help the students in the campus and to be there for any kind of support needed whether it’s technical or non-technical and to help them find their most suitable career.",
                          style: Theme.of(context).textTheme.headline2)
                    ],
                  ),
                ),

                SizedBox(
                  height: 16.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Products'.toUpperCase(),
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.headline3),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                          "Technical Sessions, Soft Skills, Workshops, Courses and Competitions.",
                          style: Theme.of(context).textTheme.headline2)
                    ],
                  ),
                ),
                SizedBox(
                  height: 32.0,
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22),
                      child: Text('Our Community'.toUpperCase(),
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.headline3),
                    ),
                    Container(
                      height: 250,
                      child: Swiper(
                        viewportFraction: 0.8,
                        scale: 0.9,
                        scrollDirection: Axis.horizontal,
                        itemCount: committeesList.length,
                        itemBuilder: (context, i) {
                          return CommitteeItem(committeesList[i]);
                        },
                      ),
                    ),
                  ],
                ),
                //    ),
                //    );
                //  }),
              ],
            ),
          ),
        ),
      ),
    ]);
    //);
  }
}
