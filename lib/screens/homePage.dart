import 'package:flutter/material.dart';

import 'package:waterlog/widgets/customDrawer.dart';
import '../widgets/pieChart.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: new IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          "WaterLog",
          style: TextStyle(fontSize: 22, color: Colors.white),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'assets/images/water.jpeg',
            fit: BoxFit.cover,
            color: Colors.black45,
            colorBlendMode: BlendMode.darken,
          ),
          ListView(
            children: <Widget>[
              PieChart(),
              SizedBox(
                height: 10,
              ),
              // StatusCard(),
            ],
          ),
        ],
      ),
      drawer: CustomDrawer(),
    );
  }
}
