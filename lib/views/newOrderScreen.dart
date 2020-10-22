import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class NewOrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(color: Colors.black),
              child: TimeSelector(),
            ),
          ),
    );
  }
}

String timeSelected;
const timeFontStyle = TextStyle(fontSize: 40, color: Colors.white);
const customerFont = TextStyle(
    wordSpacing: 7.0,
    letterSpacing: 1.50,
    fontSize: 40,
    color: Colors.black,
    fontWeight: FontWeight.bold);

const headerFont = TextStyle(
    wordSpacing: 7.0,
    letterSpacing: 2.0,
    fontSize: 40,
    color: Colors.white,
    fontWeight: FontWeight.w900);

// need to pass data from all orders to new screen state.

class TimeSelector extends StatefulWidget {
  @override
  _TimeSelectorState createState() => _TimeSelectorState();
}

class _TimeSelectorState extends State<TimeSelector> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                'CONFIRM ORDER',
                style: headerFont,
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  height: 170,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle, color: Colors.yellowAccent),
                  margin: EdgeInsets.all(5),
//                padding: EdgeInsets.all(),
//               color: Colors.white,
                  child: Column(
                    verticalDirection: VerticalDirection.down,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          ' NEW ',
                          style: customerFont,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          ' ORDER ',
                          style: customerFont,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: RaisedButton(
                        color: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),

                        elevation: 10,
                        onPressed: () {
                          Navigator.pop(context);
                          print('25-30');
                        },
                        child: Text(
                          ' 25 - 30 Minutes ',
                          style: timeFontStyle,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: RaisedButton(
                        color: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        elevation: 10,
                        onPressed: () {
                          Navigator.pop(context);
                          print('15-20');
                        },
                        child: Text(
                          ' 15 - 20 Minutes ',
                          style: timeFontStyle,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: RaisedButton(
                        color: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        elevation: 10,
                        onPressed: () {
                          Navigator.pop(context);
                          print('30-45');
                        },
                        child: Text(
                          ' 30 - 45 Minutes ',
                          style: timeFontStyle,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: RaisedButton(
                        color: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        elevation: 10,
                        onPressed: () {
                          Navigator.pop(context);
                          print('45-60');
                        },
                        child: Text(
                          ' 45 - 60 Minutes ',
                          style: timeFontStyle,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
