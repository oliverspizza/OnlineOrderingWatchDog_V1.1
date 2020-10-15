//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'dart:async';
//import 'package:http/http.dart' as http;
//import 'dart:convert';
//
//class CustomerName extends StatefulWidget {
//  @override
//  _CustomerNameState createState() => _CustomerNameState();
//}
//
//class _CustomerNameState extends State<CustomerName> {
//  var url = 'https://orderformula.net/api/product/read.php';
//  List data;
//
//  Future<dynamic> makeRequest() async {
//    var response = await http.get(url);
//    setState(() {
//      if (response.statusCode == 200) {
//        var jsonRes = jsonDecode(response.body);
//        data = jsonRes['records'];
//        print("data refresh");
//        orderCreated(data);
//      }
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Container();
//  }
//}

///var url1 =  get request for all records,
///var url2 = get request for order id
///
/// if (url1 order id > url2 order  id){
/// return url2 +1 }
