import 'package:flutter/material.dart';
import 'package:summative/constant.dart';


// void main => runApp(HomePage());
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Drawer
    Widget drawerSection = Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Seeka',
            style: TextStyle(color: Colors.white),),
            decoration: BoxDecoration(
              color:kPrimaryColor,
            ),
          ),
          ListTile(
            title: Text('Game drives'),
            onTap: () {
              // Update the state of the app
              // Closing the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Bird watching'),
            onTap: () {
              // Update the state of the app
              // Closing the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Safari walks'),
            onTap: () {
              // Update the state of the app
              // Closing the drawer
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );


    // Category Card
    Widget categoryCard = Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 80,
            width: 300,
            padding: EdgeInsets.fromLTRB(5, 5, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Expanded(
                //   child: Image.network(
                //     "https://hipvan-images-production.imgix.net/product-images/38d01649-0c3d-4e45-ab5c-19d4fce14354/CY-DD-232-grey-front.png",
                //     fit: BoxFit.cover,
                //   ),
                // ),
                Text("Apply"),
                Text("Fill in personal information within 4 minutes")
              ],
            ),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              shadows: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1.5,
                  blurRadius: 2,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
          ),SizedBox(height: 10),
        ],
      ),);


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: kPrimaryColor,
          textTheme: TextTheme(
              headline5: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
              ),
              button: TextStyle(
                color: kPrimaryColor,
              )),
          inputDecorationTheme: InputDecorationTheme(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: kPrimaryColor.withOpacity(.4),
                  )))),
      home: Scaffold(
        drawer: drawerSection,
        appBar: AppBar(),
        body: Container(
          margin: const EdgeInsets.only(top:10.0),
          child: Center(
          child: Column(
            children: [
              Image.asset('assets/images/logo.png',
              width: 60,),

              Column(
                children: [
                  categoryCard,
                  categoryCard,
                  categoryCard,
                ],
              )
            ],
          ),
          ),
        ),
      ),
    );
  }


}
