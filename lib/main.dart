import 'package:flutter/material.dart';
import './screens/homePage.dart';

import 'package:waterlog/widgets/customDrawer.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import './widgets/pieChart.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "WaterLog",
      theme: ThemeData(
        accentColor: Colors.blueGrey,
        primaryColor: Colors.lightBlueAccent,
      ),
      home: SplashScreen(),
    routes: <String, WidgetBuilder>{
      '/HomeScreen': (BuildContext context) => MyHomePage(),}
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/HomeScreen');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child:Column(

          children: <Widget>[
            SizedBox(height: 300,),
            Icon(MdiIcons.cupWater,size: 200,color: Colors.blue,),
            Padding(padding: EdgeInsets.all(50),child:Text("WaterLog",style:TextStyle(color: Colors.blueGrey,fontSize: 50)) ,)
          ],
        ),
      ),
    );
  }
}

