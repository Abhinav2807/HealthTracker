import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';

class StatusCard extends StatefulWidget {
  final num val;
  final Function refresh;

  const StatusCard({Key key, this.val,this.refresh}): super(key: key);
  @override
  _StatusCardState createState() => _StatusCardState();
}

class _StatusCardState extends State<StatusCard> {

  
  var data = [10.0, 24.0, 30.0, 12.0, 15.0, 4.0, 11.0, 15.6];


  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      // Provide an optional curve to make the animation feel smoother.
      curve: Curves.fastOutSlowIn,
      width: double.infinity,
      height: 300,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0)),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Text("Daily Intake Graph",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.blue[300],
                )),
            Padding(
              padding: const EdgeInsets.only(
                top: 40,
                left: 45,
                right: 45,
              ),
              child: Sparkline(
                data: data,
                lineColor: Colors.blueGrey,
                pointColor: Colors.deepOrange,
                pointSize: 8,
                pointsMode: PointsMode.all,
                fillMode: FillMode.below,
                fillGradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.amber[800], Colors.amber[200]]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:30,),
              child: FloatingActionButton(
                child: Icon(Icons.refresh),
                onPressed: (){
                  setState(() {
                    data.add(widget.val);
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
