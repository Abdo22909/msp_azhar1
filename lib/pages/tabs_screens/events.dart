import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:msp/models/event.dart';
import 'package:msp/pages/tabs_screens/items_widgets/event_item.dart';
import 'package:msp/services/api_services.dart';
import 'package:msp/ui/app_theme.dart';

String _url = "https://msp-app-dashboard.herokuapp.com/api/events";

class EventsScreen extends StatefulWidget {
  const EventsScreen({
    Key key,
  }) : super(key: key);

  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  Future<List<Event>> events;

  @override
  void initState() {
    events = API?.getEvents(_url);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.background,
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: getMainListViewUI(),
      ),
    );
  }

  Widget getMainListViewUI() {
    return FutureBuilder<List<Event>>(
      future: events,
      builder: (BuildContext context, snapshot) {
        List<Event> events = snapshot.data;

        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return new Center(
              child: SpinKitWave(
                size: 50,
                duration: Duration(seconds: 2),
                color: AppTheme.tab1Secondary.withOpacity(0.5),
              ),
            );
          default:
            if (!snapshot.hasError && events.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "assets/images/EmptyState.png",
                      height: 150,
                      width: 250,
                      fit: BoxFit.scaleDown,
                    ),
                    Text(
                      "No Events Yet".toUpperCase(),
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        "Stay connected, we may have \nsome events soon!",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    )
                  ],
                ),
              );
            }
            if (!snapshot.hasData)
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset("assets/images/NoInternetState.png",
                        height: 250, width: 250),
                    Text(
                      "No internet connection\nPlease check your internet\nconnection",
                      textAlign: TextAlign.center,
                      style:Theme.of(context).textTheme.headline2,
                    )
                  ],
                ),
              );
            else
              return ListView.builder(
                padding:EdgeInsets.only(bottom: 60) ,
                itemCount: events.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  var event = events[index];
                  return EventItem(
                    event,
                  );
                },
              );
        }
      },
    );
  }
}
