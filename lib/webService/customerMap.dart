import 'dart:convert';
import 'package:google_map_polyline/google_map_polyline.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoder/geocoder.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_ordering_watchdog/webService/OrderDetail.dart';
import 'dart:async';
import 'package:permission/permission.dart';

String address = '16736 26 Mile Rd';
String city = "Macomb MI";
String zip = " 48042";
String customerLocation = "$customerAddress$customerState$customerZip";
const kGoogleApiKey = "AIzaSyAErbIa5KbC98RTP-bpZYF4uCx_WDY3wqQ";

var orderDetailsAddrss = 'https://orderformula.net/api/product/read'
    '.php?argument1=$orderId';

class CustomerLocation extends StatefulWidget {
  @override
  _CustomerLocationState createState() => _CustomerLocationState();
}

class _CustomerLocationState extends State<CustomerLocation> {
  GoogleMapController _controller;
  List<LatLng> routeCoords;
  final Set<Polyline> polyline = {};
  GoogleMapPolyline googleMapPolyline =
      new GoogleMapPolyline(apiKey: kGoogleApiKey);

  @override
  void initState() {
    super.initState();
    getAddressPoint();
  }

  static const _center = const LatLng(42.715770, -82.958530);

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _controller = controller;
      polyline.add(Polyline(
          polylineId: PolylineId('route1'),
          visible: true,
          points: routeCoords,
          width: 4,
          color: Colors.red,
          startCap: Cap.roundCap,
          endCap: Cap.buttCap));
    });
  }

  getAddressPoint() async {
    var permission =
        await Permission.getPermissionsStatus([PermissionName.Location]);
    if (permission[0].permissionStatus == PermissionStatus.notAgain) {
      var askPremission =
          await Permission.requestPermissions([PermissionName.Location]);
    } else {
      print("$customerAddress$customerState$customerZip");
      routeCoords = await googleMapPolyline.getPolylineCoordinatesWithAddress(
          origin: "16736 26 mile rd macomb mi 48042",
          destination: '$customerAddress$customerState$customerZip',
          //$customerAddress$customerState$customerZip

          mode: RouteMode.driving);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 500,
      decoration: BoxDecoration(
          //borderRadius: BorderRadius.all(Radius.circular(5.0)),
          border: Border.all(width: .8, color: Colors.black)),
      child: GoogleMap(
        polylines: polyline,
        mapType: MapType.normal,
        onMapCreated: _onMapCreated,
        initialCameraPosition:
            CameraPosition(target: LatLng(42.715771, -82.958527), zoom: 15.0),
      ),
    );
  }
}
