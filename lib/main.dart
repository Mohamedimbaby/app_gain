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
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      home: MyHomePage(title: 'Flutter Demo Home Page'),

    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);



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
  BuildContext myContext;

  Future _initSDK() async {
    var data =  {'appId':'5fe07d289c2095000c3bc8b7','apiKey':'5890d8d2cc4c8501a437f59f79efe2440f1e7c0e86edf6aec7bcef2bac7c2d5b','configure':true};

    Appgain().initAppgainSDK(data);

  }

  Future _getUserID() async {
    Appgain().getUserId();
  } Future _matchLink() async {
    Appgain().matchLink();
  }
/*

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
*/


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
        centerTitle: true,
        backgroundColor: Colors.red,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Appgain.io"),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(


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
