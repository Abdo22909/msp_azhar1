import 'package:flutter/material.dart';
import 'package:msp/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomTheme  {
  static Color white = Color(0xFFffffff);
  static Color black = Color(0xFF000000);
  static Color grey = Color(0xFF86888a);
  static Color blue = Color(0xFF0077B5);
  static Color darkBlue = Color(0xFF313335);
  static const String fontName = 'Roboto';
}
ThemeData light=ThemeData(
    primaryColor: CustomTheme.white,
    iconTheme: IconThemeData(
      color: CustomTheme.black,
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(
        color: CustomTheme.blue,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),

      //title Drawer
      headline1: TextStyle(
        color: CustomTheme.black,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),

      //subtitle Drawer
      headline2: TextStyle(
          fontFamily: "Roboto",
          fontWeight: FontWeight.w400,
          fontSize: 14,
          letterSpacing: 0.2,
          color: CustomTheme.grey),
      //about
      headline3: TextStyle(
        fontFamily: CustomTheme.fontName,
        fontWeight: FontWeight.w500,
        fontSize: 18,
        color: CustomTheme.black,
      ),

    ));
ThemeData dark=ThemeData(
    primaryColor: CustomTheme.darkBlue,
    iconTheme: IconThemeData(
      color: CustomTheme.grey,
    ),
    textTheme: TextTheme(


      bodyText1: TextStyle(
        color: CustomTheme.blue,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),

      //title Drawer
      headline1: TextStyle(
        color: CustomTheme.white,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),

      //subtitle Drawer
      headline2: TextStyle(
          fontFamily: "Roboto",
          fontWeight: FontWeight.w400,
          fontSize: 14,
          letterSpacing: 0.2,
          color: CustomTheme.grey),
      //about
      headline3: TextStyle(
        fontFamily: CustomTheme.fontName,
        fontWeight: FontWeight.w500,
        fontSize: 18,
        color: CustomTheme.white,
      ),

    ));

class ThemeNotifier extends ChangeNotifier{
  final String key='theme';
  SharedPreferences _pref;
  bool _lightTheme;
  bool get lightTheme=>_lightTheme;

  ThemeNotifier(){
    _lightTheme=true;
    _loadFormPref();
  }
  toggleTheme() {
  _lightTheme = !_lightTheme;
  _saveToPref();
  notifyListeners();
  }
  _initPref()async{
    if(_pref==null){
      _pref=await SharedPreferences.getInstance();
    }
  }
  _loadFormPref()async{
    await _initPref();
    _lightTheme=_pref.getBool(key) ?? true;
    notifyListeners();
  }
  _saveToPref()async{
    await _initPref();
    _pref.setBool(key, _lightTheme);
  }
}

class AppTheme {
  AppTheme._();

  // Tab 1 Colors
  static const Color tab1Primary = Color(0xFF005162);
  static const Color tab1Secondary = Color(0xFF0077b5);

  // Tab 2 Colors
  static const Color tab2Primary = Color(0xFF3e0c66);
  static const Color tab2Secondary = Color(0xFF0077b5);

  // Tab 3 Colors
  static const Color tab3Primary = Color(0xFF002e62);
  static const Color tab3Secondary = Color(0xFF3056ec);

  // Tab 4 Colors
  static const Color tab4Primary = Color(0xFF620051);
  static const Color tab4Secondary = Colors.blue;

  ///////////////////////////////////////////////////

  static const Color nearlyWhite = Color(0xFFFAFAFA);
  static const Color white = Color(0xFFFFFFFF);
  static const Color background = Color(0xFFF2F3F8);
  static const Color nearlyDarkBlue = Color(0xFF1A2980);

  static const Color nearlyBlue = Color(0xFF26D0CE);
  static const Color nearlyBlue2 = Color(0xFF2398ba);
  static const Color nearlyBlack = Color(0xFF213333);
  static const Color grey = Color(0xFF3A5160);
  static const Color dark_grey = Color(0xFF313A44);

  static const Color darkText = Color(0xFF253840);
  static const Color darkerText = Color(0xFF17262A);
  static const Color lightText = Color(0xFF4A6572);
  static const Color deactivatedText = Color(0xFF767676);
  static const Color dismissibleBackground = Color(0xFF364A54);
  static const Color spacer = Color(0xFFF2F2F2);
  static const String fontName = 'Roboto';

  static const TextTheme textTheme = TextTheme(
    display1: display1,
    headline: headline,
    title: title,
    subtitle: subtitle,
    body2: body2,
    body1: body1,
    caption: caption,
  );

  static const TextStyle display1 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 36,
    letterSpacing: 0.4,
    height: 0.9,
    color: darkerText,
  );

  static const TextStyle headline = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 24,
    letterSpacing: 0.27,
    color: darkerText,
  );

  static const TextStyle title = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 0.18,
    color: darkerText,
  );

  static const TextStyle subtitle = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: -0.04,
    color: darkText,
  );

  static const TextStyle body2 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.2,
    color: darkText,
  );

  static const TextStyle body1 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: -0.05,
    color: darkText,
  );

  static const TextStyle caption = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.2,
    color: lightText, // was lightText
  );
}
