import 'package:msp/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:msp/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'ui/app_theme.dart';
import 'package:provider/provider.dart';

int isviewed;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isviewed = prefs.getInt('onBoard');
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
        builder: (context, ThemeNotifier notifier, child) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: "MSP Al-Azhar",
              theme: notifier.lightTheme ? light : dark,
              onGenerateRoute: Rout.generateRoute,
              initialRoute: splash);
        },
      ),
    );
  }
}
