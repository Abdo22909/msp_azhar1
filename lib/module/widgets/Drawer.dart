import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:msp/module/widgets/slidepopupdialog.dart';
import 'package:msp/pages/tabs_screens/about.dart';
import 'package:msp/ui/app_theme.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:msp/services/open_url.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {


  @override
  Widget build(BuildContext context) {

    return Container(
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              width: double.infinity,
              //color: Colors.blueGrey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          child: CircleAvatar(
                            child: Image(
                              image: AssetImage("assets/images/msp_logo.png"),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: Text(
                            "MSP Tech club at Al-Azhar ",
                            style: Theme.of(context).textTheme.bodyText1,
                            overflow: TextOverflow.visible,
                            softWrap: true,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "MicroSoft Student Partner",
                      style: Theme.of(context).textTheme.headline2,
                      overflow: TextOverflow.visible,
                      softWrap: true,
                    ),
                    Text(
                      "Al-Azhar University",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    Divider(
                      height: 30,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),

            //theme
            Consumer<ThemeNotifier>(
                builder: (context, ThemeNotifier notifier, child) {
                  return buildListTile(
                    notifier.lightTheme? Icons.light_mode : Icons.dark_mode,
                    notifier.lightTheme? 'Light Theme' : 'Dark Theme',
                    notifier.lightTheme ? 'Change Dark Theme' : 'Change Light Theme',
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Theme.of(context).iconTheme.color,
                    ),
                        () {
                      notifier.toggleTheme();
                    },
                  );
                }),
            //Developers
            buildListTile(
              Icons.people,
              'Developers',
              'Update developers',
              Icon(
                Icons.arrow_forward_ios,
                color: Theme.of(context).iconTheme.color,
              ),
                  () {
                Navigator.of(context).pop();
                _showDialog();
              },
            ),
            //web
            buildListTile(
              Icons.computer_outlined,
              'Web',
              'Go to web Site',
              Icon(
                Icons.arrow_forward_ios,
                color: Theme.of(context).iconTheme.color,
              ),
                  () {
                Navigator.of(context).pop();
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (_) => AssetGiffyDialog(
                      buttonOkColor: Color(0xFF3056ec),
                      buttonCancelColor: Color(0xFF3056ec),
                      image: Image.asset('assets/images/error-404.gif'),
                      buttonOkText: Text('Send'),
                      title: Text(
                        'Attention',
                        style: TextStyle(
                            fontSize: 22.0, fontWeight: FontWeight.w600),
                      ),
                      description: Text(
                        '''The website is in a state of maintenance now. For more details, you should refer to support and assistance. \nDo you want to contact support and assistance?.'''
                            .trim(),
                        textAlign: TextAlign.center,
                        style: TextStyle(),
                      ),
                      entryAnimation: EntryAnimation.DEFAULT,
                      onOkButtonPressed: () {
                        openURL('mailto:minaelking424@gmail.com', false);
                      },
                    ));
              },
            ),
            //Share
            buildListTile(
              Icons.share,
              'Share',
              'Share Application',
              Icon(
                Icons.arrow_forward_ios,
                color: Theme.of(context).iconTheme.color,
              ),
                  () => Share.share(
                "https://play.google.com/store/apps/details?id=com.mspazhar.msp",
              ),
            ),
            //About
            buildListTile(
              Icons.account_box_outlined,
              'About',
              'About Application',
              Icon(
                Icons.arrow_forward_ios,
                color: Theme.of(context).iconTheme.color,
              ),
                  () {
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => Scaffold(
                          backgroundColor: Theme.of(context).primaryColor,
                          appBar: AppBar(
                            title: Text('About',
                              style: Theme.of(context).textTheme.bodyText1,),
                          ),
                          body: AboutScreen(),
                        )));
              },
            ),
            //feedBack
            buildListTile(
              Icons.send,
              'Send Feedback',
              'By Account G-Mail',
              Icon(
                Icons.arrow_forward_ios,
                color: Theme.of(context).iconTheme.color,
              ),
                  () => openURL('mailto:mspshr12@gmail.com', false),
            ),

            //Support & help
            buildListTile(
              FontAwesomeIcons.stream,
              'Support & help',
              'Submit your problem',
              Icon(
                Icons.arrow_forward_ios,
                color: Theme.of(context).iconTheme.color,
              ),
                  () => openURL('mailto:abdo.mohamed01550@gmail.com', false),
            ),
          ],
        ),
      ),
    );
  }

  _showDialog() {
    showMaterialModalBottomSheet(
      backgroundColor: Colors.white.withOpacity(0.0),
      context: context,
      builder: (context) =>Slides(),
    );
  }

  ListTile buildListTile(IconData leadingIcon, String title, String subtitle,
      Widget trailingIcon, Function onTap) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        leadingIcon,
        color: Theme.of(context).iconTheme.color,
      ),
      title: Text(title, style: Theme.of(context).textTheme.headline1),
      subtitle: Text(subtitle, style: Theme.of(context).textTheme.headline2),
      trailing: trailingIcon,
    );
  }
}
