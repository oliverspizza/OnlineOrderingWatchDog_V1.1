import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class NewOrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(color: Colors.grey),
              child: TimeSelector(),
            ),
          ),
        ),
      ),
    );
  }
}

String timeSelected;
const timeFontStyle = TextStyle(fontSize: 40, color: Colors.black);
const customerFont = TextStyle(
    wordSpacing: 7.0,
    letterSpacing: 1.50,
    fontSize: 42,
    color: Colors.white,
    fontWeight: FontWeight.bold);

class TimeSelector extends StatefulWidget {
  @override
  _TimeSelectorState createState() => _TimeSelectorState();
}

class _TimeSelectorState extends State<TimeSelector> {
  var _customerName = 'John Oliver';
  var _phoneNumber = '(248)-379-3715';

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
              RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                padding: EdgeInsets.all(10),
                elevation: 10,
                onPressed: () {
                  print('15-20');
                },
                child: Text(
                  ' 15 - 20 Minutes ',
                  style: timeFontStyle,
                ),
              ),
              Text(
                'How long?',
                style: customerFont,
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                padding: EdgeInsets.all(10),
                elevation: 10,
                onPressed: () {
                  print('25-30');
                },
                child: Text(
                  ' 25 - 30 Minutes ',
                  style: timeFontStyle,
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(45),
                child: Container(
                  height: 170,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle, color: Colors.red),
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
                          'Customer Name: $_customerName',
                          style: customerFont,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          'Phone Number: $_phoneNumber',
                          style: customerFont,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                padding: EdgeInsets.all(10),
                elevation: 10,
                onPressed: () {
                  print('30-45');
                },
                child: Text(
                  ' 30 - 45 Minutes ',
                  style: timeFontStyle,
                ),
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                padding: EdgeInsets.all(10),
                elevation: 10,
                onPressed: () {
                  print('45-60');
                },
                child: Text(
                  ' 45 - 60 Minutes ',
                  style: timeFontStyle,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}