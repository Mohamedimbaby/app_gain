import 'dart:async';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Appgain.dart';
import 'TextFieldAlertDialog.dart';
//import 'package:fluttertoast/fluttertoast.dart';
void main() {
  runApp(MyApp());

}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),

    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance
    //        .addPostFrameCallback((_) => _initSDK());
    //Timer.run(() => _initSDK());
  }
  int _counter = 0;
  BuildContext myContext;
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }
  Future _initSDK() async {
    var data =  {'appId':'5fe07d289c2095000c3bc8b7','apiKey':'5890d8d2cc4c8501a437f59f79efe2440f1e7c0e86edf6aec7bcef2bac7c2d5b','configure':true};

    Appgain().initAppgainSDK(data);

    // TextFieldAlertDialog().displayDialog(myContext);
  }

  Future _getUserID() async {
    Appgain().getUserId();
  } Future _matchLink() async {
    Appgain().matchLink();
  }

  Future _fireAutomatorWithPersonalization() async {

    TextFieldAlertDialog().displaytriggerWithValuesDialog(context);
    // Appgain().fireAutomatorWithPersonalization();
  }
  Future _fireAutomator() async {
    TextFieldAlertDialog().displaytriggerPointDialog(context);

    // Appgain().fireAutomator();
  }
  Future _setuserId() async {
    Appgain().setuserId();
  }

  Future _addPurchase() async {
    TextFieldAlertDialog().displayLogPurshaceDialog(context);
  }
  Future _enableReciveNotification() async {
    Appgain().enableReciveNotification();
  }
  Future _addemailChannel() async {
    TextFieldAlertDialog().displayShowEmailDialog(context);
    //notificationType (String) one of theses values ("appPush","sms","email","webPush")

    //var data = {'notificationType':'email','item':'value'};
    //Appgain().addNotificationChannel(data);
  }

  Future _addsmsChannel() async {
    TextFieldAlertDialog().displayShowSMSDialog(context);
    //notificationType (String) one of theses values ("appPush","sms","email","webPush")

     var data = {'notificationType':'sms','item':'value'};
     Appgain().addNotificationChannel(data);
  }


  Future _updateUser() async {
    // var data = {'email': 'updated@appgain.io', 'phone': '0123456789'};
    //  Appgain().updateUser(data);

    TextFieldAlertDialog().displayUpdateUserDialog(context);
  }
  Future _logEvent() async {
    TextFieldAlertDialog().displayLogEventDialog(context);
    //var data = {'type': 'testType', 'action': 'testAction'};
    //Appgain().logEvent(data);
  }


  @override
  Widget build(BuildContext context) {
    myContext = context;
    // _initSDK();
   // Future.delayed(Duration.zero, () => TextFieldAlertDialog().displayDialog(myContext));

    rootContext = context;
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(

        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Appgain.io"),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            RaisedButton(
                child: Text("INITALIZE"),
                onPressed: _initSDK,
                shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
            )             ,
            RaisedButton(
                child: Text("GET USER ID"),
                onPressed: _getUserID,
                shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
            )             ,
            RaisedButton(
                child: Text("MATCH LINK"),
                onPressed: _matchLink,
                shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
            )             ,

            RaisedButton(
                child: Text("FIRE AUTOMATOR WITH PERSONALIZATION"),
                onPressed: _fireAutomatorWithPersonalization,
                shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
            )             ,
            RaisedButton(
                child: Text("FIRE AUTOMATOR"),
                onPressed: _fireAutomator,
                shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
            )             ,
//            RaisedButton(
//                child: Text("UPDATE USER ID"),
//                onPressed: _setuserId,
//                shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
//            )             ,
            RaisedButton(
                child: Text("Enable Receive Notification"),
                onPressed: _enableReciveNotification,
                shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
            )             ,

//            RaisedButton(
//                child: Text("Enable Notification"),
//                onPressed: _enableReciveNotification,
//                shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
//            )             ,
            RaisedButton(
                child: Text("ADD EMAIL CHANNEL"),
                onPressed: _addemailChannel,
                shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
            )             ,
            RaisedButton(
                child: Text("ADD SMS CHANNEL"),
                onPressed: _addsmsChannel,
                shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
            )             ,
            RaisedButton(
                child: Text("UPDATE USER"),
                onPressed: _updateUser,
                shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
            )             ,
            RaisedButton(
                child: Text("LOG EVENT"),
                onPressed: _logEvent,
                shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
            )             ,

          ],
        ),
      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: null,
//        tooltip: 'Increment',
//        child: Icon(Icons.add),
//      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
