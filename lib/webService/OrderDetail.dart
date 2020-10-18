import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

var orderId;
var customerName;
var customerAddress;
var customerPhone;
var customerOrderType;
var customerState;
var customerZip;

const detailFont = TextStyle(fontSize: 20, fontWeight: FontWeight.w900);
const fontLook = TextStyle(fontSize: 25, fontWeight: FontWeight.bold);
const titleFont = TextStyle(fontSize: 40);

class OrderDetail extends StatefulWidget {
  @override
  _OrderDetailState createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  List dataDetail = [];

  // Main item ID
  String parentItemId;
  List<String> modifierList = [];
  // Main item name
  String parentName;
  String parentCategory;
  String parentCatId;
  List<String> catModifierList = [];
  Timer count;

  ///api for order detail(get request)
  var url = 'https://orderformula'
      '.net/api/product/readitems'
      '.php?argument1=$orderId';

  Future<dynamic> _orderDetailRequest() async {
    var response = await http.get(url);
    setState(() {
      if (response.statusCode == 200) {
        var jsonRes = jsonDecode(response.body);
        dataDetail = jsonRes['items'];
      }
      for (var i = 0; i < dataDetail.length / 2; i++) {
        var temp = dataDetail[i];
        dataDetail[i] = dataDetail[dataDetail.length - 1 - i];
        dataDetail[dataDetail.length - 1 - i] = temp;
      }

      ///  Item ID matches parent ID of modifiers.

//      for (var i in dataDetail) {
//        if (double.parse(i["ParentID"]) == 0) {
//          parentName = i["RefName"];
//          parentItemId = i["ParentID"];
//        }
//      }
//      for (var i in dataDetail) {
//        if (double.parse(i["ParentID"]) == double.parse(parentItemId) &&
//            i["RefType"] == "P") {
//          modifierList.add(i["RefName"]);
//        }
//      }
    });
  }

//  int total = 0;
//  addValue() {
//    total++;
//  }
//
//  @override
//  void initState() {
//    if (total != 2) {
//      addValue();
//      count = Timer.periodic(
//          Duration(seconds: 1), (Timer t) => _orderDetailRequest());
//    }
//  }

  @override
  void initState() {
    _orderDetailRequest();
  }

  /// calling dispose after loading
  @override
  void dispose() {
    super.dispose();
    _orderDetailRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(250.0),
          child: SafeArea(
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              width: 200,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            customerName.toUpperCase(),
                            style: titleFont,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            customerPhone.toUpperCase(),
                            style: fontLook,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            customerAddress.toUpperCase(),
                            style: fontLook,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            customerZip.toUpperCase(),
                            style: detailFont,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            customerOrderType.toUpperCase(),
                            style: fontLook,
                          ),
                        ),
                      ],
                    ),
                  ),
//                  CustomerLocation(),
                ],
              ),
            ),
          ),
        ),
        body: ListView.builder(
            itemExtent: 55,
            itemCount: dataDetail.length,
            itemBuilder: (BuildContext context, int index) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(25, 20, 25, 5),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          dataDetail[index]["Qty"],
                          style: fontLook,
                        ),
                        Text(dataDetail[index]["RefName"], style: fontLook),
                        Text(dataDetail[index]["ItemAmount"], style: fontLook),
                      ],
                    ),
                  ),
                ),
              );
            }));
  }
}
