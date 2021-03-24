import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:summative/controllers/constant.dart';

class Dashboard extends StatelessWidget {
  // White Text Style
  final TextStyle mainTextStyle = GoogleFonts.poppins(
      textStyle:
      TextStyle(color: Colors.white, fontSize: 16, letterSpacing: 1.5));

  // Black Text Style
  final TextStyle secondaryTextStyle = GoogleFonts.poppins(
      textStyle:
      TextStyle(color: Colors.black, fontSize: 16, letterSpacing: 1.5));

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: kPrimaryColor,
          textTheme: TextTheme(
              headline5: secondaryTextStyle,
              button: TextStyle(
                color: kPrimaryColor,
              )),
          inputDecorationTheme: InputDecorationTheme(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
            color: kPrimaryColor.withOpacity(.4),
          )))),
      home: DefaultTabController(
        length: choices.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Seeka',
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: Colors.white, fontSize: 30, letterSpacing: 1.5)),
            ),
            bottom: TabBar(
              isScrollable: true,
              labelStyle: mainTextStyle,
              tabs: choices.map<Widget>((Choice choice) {
                return Tab(
                  text: choice.title,
                  icon: Icon(choice.icon),
                );
              }).toList(),
            ),
          ),
          body: TabBarView(
            children: choices.map((Choice choice) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: ChoicePage(
                  choice: choice,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class Choice {
  final String title;
  final IconData icon;

  const Choice({this.title, this.icon});
}

const List<Choice> choices = <Choice>[
  Choice(title: 'Status', icon: Icons.directions_car),
  Choice(title: 'History', icon: Icons.directions_bike),
];

class ChoicePage extends StatelessWidget {
  const ChoicePage({Key key, this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = GoogleFonts.poppins(
        textStyle:
            TextStyle(color: kPrimaryColor, fontSize: 30, letterSpacing: 1.5));
    return Card(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            choice.icon,
            size: 150.0,
            color: textStyle.color,
          ),
          Text(
            choice.title,
            style: textStyle,
          ),
        ],
      ),
    );
    return null;
  }
}
