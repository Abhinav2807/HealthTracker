import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'dart:convert';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:waterlog/widgets/statusCard.dart';

class PieChart extends StatefulWidget {
  @override
  _PieChartState createState() => _PieChartState();
}

class _PieChartState extends State<PieChart> {
  final GlobalKey<AnimatedCircularChartState> _chartKey =
      new GlobalKey<AnimatedCircularChartState>();

  var value = 0.1;
  num val = 0;
  num maxVal = 100.0;
  Future<int> fetchData() async {
    const url = 'https://new-water-log-ivynip.firebaseio.com/volInfo.json';
    try {
      final response = await http.get(url);
      final recievedResponse =
          json.decode(response.body) as Map<String, dynamic>;

      val = recievedResponse['sumVol'];

      return (val);
    } catch (error) {
      throw error;
    }
  }

  Future<void> _pullRefresh(BuildContext) async {
    await fetchData();
  }

  Color labelColor = Colors.red[200];
  List<CircularStackEntry> _generateChartData(double value) {
    Color dialColor = Colors.blue;
    if (value < 50) {
      dialColor = Colors.red[200];
    } else if (value > 50) {
      dialColor = Colors.blue;
    } else if (value > 100) {
      dialColor = Colors.cyan;
    }
    labelColor = dialColor;

    List<CircularStackEntry> data = <CircularStackEntry>[
      new CircularStackEntry(
        <CircularSegmentEntry>[
          new CircularSegmentEntry(
            value,
            dialColor,
            rankKey: 'percentage',
          )
        ],
        rankKey: 'percentage',
      ),
    ];
    if (value > 100) {
      labelColor = Colors.green;

      data.add(new CircularStackEntry(
        <CircularSegmentEntry>[
          new CircularSegmentEntry(
            value - 100,
            Colors.green[200],
            rankKey: 'percentage',
          ),
        ],
        rankKey: 'percentage2',
      ));
    }

    return data;
  }

  void refresh() {
    setState(() {
      fetchData().then((val) {
        Future.delayed(const Duration(seconds: 5));
        value = val.toDouble();
        List<CircularStackEntry> data = _generateChartData(value);
        _chartKey.currentState.updateData(data);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    TextStyle _labelStyle = Theme.of(context)
        .textTheme
        .title
        .merge(new TextStyle(color: labelColor));
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                top: 20,
              ),
              // width: double.infinity,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                // color: Colors.white70,
                elevation: 20,
                child: AnimatedCircularChart(
                  key: _chartKey,
                  size: const Size(200.0, 200.0),
                  initialChartData: _generateChartData(value),
                  chartType: CircularChartType.Radial,
                  edgeStyle: SegmentEdgeStyle.round,
                  percentageValues: true,
                  holeLabel: '$value lit',
                  labelStyle: _labelStyle,
                ),
              ),
            ),
            Container(
              height: 230,
              width: 215,
              padding: EdgeInsets.only(top: 20),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                elevation: 20,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Weekly Stats",
                        style: TextStyle(
                            fontSize: 20,
                            // fontWeight: FontWeight.bold,/
                            color: Colors.blue[300]),
                      ),
                    ),
                    ListTile(
                      leading: Icon(MdiIcons.water),
                      title: Text(
                        "Total Intake : ",
                        style: TextStyle(fontSize: 15, color: Colors.cyan),
                      ),
                      trailing: Text(
                        value.toString(),
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListTile(
                      leading: Icon(MdiIcons.glassMug),
                      title: Text(
                        "Weekly Target :",
                        style: TextStyle(fontSize: 15, color: Colors.cyan),
                      ),
                      trailing: Text(maxVal.toString(),
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        new SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: new Row(children: <Widget>[
              Container(
                height: 100,
                width: 100,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  child: Icon(
                    MdiIcons.food,
                    color: Colors.orange,
                    size: 50,
                  ),
                ),
              ),
              Container(
                height: 100,
                width: 100,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  child: Icon(
                    MdiIcons.heart,
                    color: Colors.red,
                    size: 50,
                  ),
                ),
              ),
              Container(
                height: 100,
                width: 100,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  child: Icon(
                    MdiIcons.footPrint,
                    color: Colors.brown,
                    size: 50,
                  ),
                ),
              ),
              Container(
                height: 100,
                width: 100,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  child: Icon(
                    MdiIcons.weightKilogram,
                    color: Colors.black,
                    size: 50,
                  ),
                ),
              ),
            ])),
        SizedBox(
          height: 20,
        ),
        StatusCard(
          val: value,
          refresh: refresh,
        ),
        Padding(
          padding: const EdgeInsets.all(32),
          child: SizedBox(
            height: 55,
            width: 150,
            child: RaisedButton(
                child: Text("Update",
                    style: TextStyle(fontSize: 18, color: Colors.white)),
                onPressed: () {
                  setState(() {
                    fetchData().then((val) {
                      setState(() {
                        value = val.toDouble();
                        List<CircularStackEntry> data =
                            _generateChartData(value);
                        _chartKey.currentState.updateData(data);
                      });
                    });
                  });
                },
                color: Colors.lightBlueAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0))),
          ),
        ),
      ],
    );
  }
}
