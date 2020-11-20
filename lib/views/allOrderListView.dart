import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'newOrderScreen.dart';
import 'package:online_ordering_watchdog/webService/OrderDetail.dart';
import '../main.dart';

const titleFont = TextStyle(fontSize: 20);
final assetsAudioPlayer = AssetsAudioPlayer();

class AllOrderPreviewListView extends StatefulWidget {
  @override
  _AllOrderPreviewListViewState createState() =>
      _AllOrderPreviewListViewState();
}

class _AllOrderPreviewListViewState extends State<AllOrderPreviewListView> {
//  ScrollController _scrollController = ScrollController();
//  int _curretnMax = 10;
  var url = 'https://orderformula.net/api/product/read.php';
  List data;
  List previousData;
  var newOrder;
  var oldOrder;

  Future<dynamic> makeRequest() async {
    var response = await http.get(url);
    setState(() {
      if (response.statusCode == 200) {
        var jsonRes = jsonDecode(response.body);
        data = jsonRes['records'];
        print("data refresh");
        orderCreated(data);
      }
    });
  }

  /// refresh check for new orders every 15 seconds..
  Timer refresh;

  @override
  void initState() {
    super.initState();
    refresh = Timer.periodic(Duration(seconds: 15), (Timer t) => makeRequest());
//    _scrollController.addListener(() {
//      if (_scrollController.position.pixels ==
//          _scrollController.position.maxScrollExtent) {
//        _getMoreData();
//      }
//    });
  }

//  _getMoreData() {
//    for (int i = _curretnMax; i < _curretnMax + 10; i++) {}
//  }

  @override
  void dispose() {
    super.dispose();
    refresh.cancel();
  }

  _paidStatus(String paidStatus) {
    if (paidStatus == "") {
      return "UNPAID";
    } else {
      return "PAID";
    }
  }

  /// _futureOrder checks to see if order is delayed, if so function
  /// returns datetime value parsed in Month-date-time(12hour format).
  /// "1" equals deferred order, "0" equals order for now.
  _futureOrder(String checkForDefer, String orderTimeDate) {
    if (checkForDefer == "1") {
      var orderTime = DateTime.parse(orderTimeDate);
      //time order is required
      var timeOfDay = DateFormat.jm().format(orderTime).toString();
      //date order is required
      var dateOfOrder = DateFormat.MMMd().format(orderTime).toString();
      return "Required on $dateOfOrder at $timeOfDay";
    } else {
      return "Asap Order";
    }
  }
  
    /// returns time order was placed at
  _orderTime(String time) {
    var orderAtTime = DateTime.parse(time);
    var timeZone = orderAtTime;
    var dayOfOrder = DateFormat.E().format(timeZone).toString();
    var timeOfOrder = DateFormat.jm().format(timeZone).toString();
    return "$timeOfOrder on $dayOfOrder";
  }

  /// orderCreated calculates if new order was received.
  ///
  ///               ORDER CHECKER
  ///
  orderCreated(List data) {
    for (var i in data) {
      var now = DateTime.now().subtract(Duration(hours: 3));
      // gets time of order less time difference(3 hours) because of
      // server location
      var orderTime = DateTime.parse(i["CreatedDate"]);
      // "difference" checks for difference in current time and timestamp on
      // order
      var difference = now.difference(orderTime);
      // if difference is within 15 seconds of current time and less then 20
      // seconds of current time audio asset will get triggered.
      if (difference > Duration(seconds: 10) &&
          difference < Duration(seconds: 20)) {
        // need to fire function that changes state of screen, maybe a
        // navigator push screen, with a gesture detector that pops the
        // screen off.
        assetsAudioPlayer.open("assets/Bruh-sound-effect.mp3");
        print("NEW ORDER");
        orderId = i["id"];
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => NewOrderScreen())); //
        // need to take
        // customer
        // data in
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          drawer: HomeScreenDrawer(),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(150.0),
            child: SafeArea(child: CustomAppBar()),
          ),
          body: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              decoration: new BoxDecoration(
                  color: Colors.blueGrey[50],
                  borderRadius: BorderRadius.circular(10)),
              child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                        height: 40,
                        color: Colors.black,
                      ),
//              controller: _scrollController,
//                  itemExtent: 125,
                  itemCount: data == null ? 0 : data.length,
                  itemBuilder: (BuildContext context, i) {
                    return ListTile(
                      contentPadding: EdgeInsets.fromLTRB(20, 5, 20, 5),
//                  leading: Text(
//                    _paidStatus(data[i]["CCNo"]).toString(),
//                    style: detailFont,
//                  ),
                      isThreeLine: true,
                      onTap: () {
                        customerName = data[i]["CustomerName"];
                        customerOrderType = data[i]["OrderType"];
                        customerPhone = data[i]["CustomerMobile"];
                        customerAddress = data[i]["CustomerAddress"];
                        customerZip = data[i]["CustomerZip"];
                        customerState = data[i]["CustomerState"];
                        orderId = data[i]["id"];

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OrderDetail()),
                        );
                      },
                      title: Text(
                        'Name: ${data[i]["CustomerName"].toUpperCase()}\nOrder '
                        '#: '
                        '${data[i]["id"].toUpperCase()}',
                        style: detailFont,
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text(
                            "${data[i]["OrderType"]}"
                            "\nOrdered at ${_orderTime(data[i]["CreatedDate"])}", //DateFormat.MMMd().format
                            // (data[i]["CreatedDate"]).toString()
                            style: detailFont,
                          ),
                          Text(
                            _paidStatus(data[i]["CCNo"]).toString(),
                            style: detailFont,
                          ),
//                      Text(
//                        "Customer number: ${data[i]["CustomerMobile"]}",
//                        style: detailFont,
//                      ),
                          Text(
                            _futureOrder(data[i]["FutureOrder"],
                                    data[i]["FutureDate"])
                                .toString(),
                            style: detailFont,
                          ),
                        ],
                      ),
                      trailing: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Total sale \$ ${data[i]["TotalAmount"]}",
                            style: titleFont,
                          ),
                          Text(
                            "Tip amount \$ ${data[i]["Tip"]}",
                            style: titleFont,
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
