import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:online_ordering_watchdog/webService/OrderDetail.dart';

class NewOrderScreen extends StatelessWidget {
  String custName;
  String phoneNumber;
  String orderID;
  NewOrderScreen(
    String custName,
    String phoneNumber,
    String orderID,
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(color: Colors.black),
              child: TimeSelector(custName, phoneNumber, orderID),
            ),
          ),
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
  String custName;
  String phoneNumber;
  String orderID;
  TimeSelector(
    String custName,
    String phoneNumber,
    String orderID,
  );
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
                          widget.custName,
                          style: customerFont,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          widget.phoneNumber,
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
              Padding(
                padding: const EdgeInsets.only(bottom: 55.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      color: Colors.red,
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
                    RaisedButton(
                      color: Colors.red,
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
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      color: Colors.red,
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
                      color: Colors.red,
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}
