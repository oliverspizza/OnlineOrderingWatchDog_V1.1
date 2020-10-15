import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_ordering_watchdog/views/allOrderListView.dart';
import 'package:online_ordering_watchdog/webService/OrderDetail.dart';
import 'model/cartData.dart';
import 'package:provider/provider.dart';
import './views/newOrderScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // multiprovider not needed it looks like
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CartItemData(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FirstHalf(),
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.grey[50],
            accentColor: Color(0xFF4c8c4a),
            primaryColor: Color(0xFF1b5e20),
            textTheme: TextTheme(body1: TextStyle(color: Colors.black))),
      ),
    );
  }
}

class FirstHalf extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: HomeScreenDrawer(), body: AllOrderPreviewListView());
  }
}

class CustomAppBar extends StatelessWidget {
  logo() {
    return Text(
      "Online Ordering",
      style: TextStyle(fontSize: 75),
    );

//      ClipRect(
//      child: Align(child: Image.asset('assets/o_logo.png')),
//    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.red,
        height: MediaQuery.of(context).size.height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            logo(),
            GestureDetector(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: IconButton(
                  iconSize: 50,
                  icon: Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

const drawerFont = TextStyle(color: Colors.red, fontSize: 20);

class HomeScreenDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 10.0,
      child: ListView(
        children: <Widget>[
          ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AllOrderPreviewListView()));
            },
            title: Text(
              "All Orders",
              style: drawerFont,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => OrderDetail()));
            },
            title: Text("Last Order Detail", style: drawerFont),
          ),
          ListTile(
            onTap: () {
//              Navigator.push(context,
//                  MaterialPageRoute(builder: (context) => NewOrderScreen()));
            },
            title: Text("Something", style: drawerFont),
          ),
        ],
      ),
    );
  }
}

DateTime currentTime = DateTime.now();
