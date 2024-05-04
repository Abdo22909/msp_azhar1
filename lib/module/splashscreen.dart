import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:msp/module/onboarding.dart';
import 'package:msp/main.dart';
import 'package:msp/pages/home.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 4),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) =>
                isviewed != 0 ? OnBoarding() : Home())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
            Padding(
                padding: EdgeInsets.only(top: 100),
                child: Image(
                  image: AssetImage('assets/images/msp_logo.png'),
                  width: 150,
                  height: 150,
                )),
            Padding(
                padding: EdgeInsets.only(bottom: 50),
                child: Column(
                  children: [
                    AnimatedTextKit(animatedTexts: [
                      TypewriterAnimatedText(
                        '</MSP Tech club at Al-Azhar>',
                        textStyle: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                        speed: Duration(milliseconds: 135),
                      ),
                    ]),
                    AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                          '</Microsoft Student Partner>',
                          textStyle: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                              fontWeight: FontWeight.normal),
                          speed: Duration(milliseconds: 135),
                        ),
                      ],
                    ),
                  ],
                )),
            Column(children: [
              Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: CircularProgressIndicator(
                    color: Colors.red,
                  )),
              Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child: Text(
                    'Welcome To Application',
                    style: TextStyle(fontSize: 18),
                  ))
            ])
          ])),
    );
  }
}
