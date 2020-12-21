import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'TextFieldAlertDialog.dart';



class Appgain {

  static const appgainPlatform =
  const MethodChannel('com.Appgain.io/AppgainSDK');

  final _initalizeAppgainSDK =  'initSDK';
  final _gettingUserId =  'getUserID';

  final _createMatchLink = 'matchLink';
  final _createfireAutomatorWithPersonalization = 'fireAutomatorWithPersonalization';
  final _createfireAutomator = 'fireAutomator';
  final _setUpuserId = 'setuserId';
  final _logNewPurchase = 'addPurchase';
  final _enableReciveNotificationWith = 'enableReciveNotification';
  final _createNotificationChannel = 'addNotificationChannel';
  final _updateUserWith = 'updateUser';
  final _logEventwith = 'logEvent';
  //parameter :-
// appId (String)
// apiKey (String)
// configure (Bool)
// Output : -  callback with two parameter
  ///   response  as string
  ///    info dictionary
  ///
  ///
  ///
  BuildContext myContext;

  Future setUpContext(BuildContext context) async {

  }


  Future initAppgainSDK(Map data) async {
    try {
      await appgainPlatform
          .invokeMethod(_initalizeAppgainSDK, data)
          .then((result) {
        //add what you like here
        print(result);
        TextFieldAlertDialog().showAlertDialog( result.toString());

      });
    } on PlatformException catch (e) {
      print("===================" + e.message);
    }
  }

  //Getting userID
//Output  : - callback with userID

  Future getUserId() async {
    try {
      await appgainPlatform
          .invokeMethod(_gettingUserId, '')
          .then((result) {
        //add what you like here
        // print(result);
        TextFieldAlertDialog().showAlertDialog("userId=" + result.toString());
        //            TextFieldAlertDialog().showAlertDialog("success");


      });
    } on PlatformException catch (e) {
      print( "========================================= "+ e.message);
    }
  }





  Future matchLink() async {
    try {
      await appgainPlatform
          .invokeMethod(_createMatchLink, '')
          .then((result) {
        //add what you like here
        print("========= "+result);

        // TextFieldAlertDialog().showAlertDialog( result.toString());
        TextFieldAlertDialog().showAlertDialog(result.toString());

      });
    } on PlatformException catch (e) {
      print(e.message);
    }
  }


//MARK: create automator

//trigger (String)

// Output : -  callback with two parameter
  ///   response  as string
  ///    info dictionary

  Future fireAutomatorWithPersonalization(Map data) async {
    try {

      // var data = {'triggerPointName':'value','personalizationMap':{'key':'value','key':'value','key':'value'}};


      await appgainPlatform
          .invokeMethod(_createfireAutomatorWithPersonalization, data)
          .then((result) {
        //add what you like here
        print(result);
        // TextFieldAlertDialog().showAlertDialog( result.toString());
        TextFieldAlertDialog().showAlertDialog("success");

      });
    } on PlatformException catch (e) {
      print(e.message);
    }
  }
  //MARK: create automator with exta parameter

//trigger (String)
//userId (String)
//parameters Dictionary of key and value

// Output : -  callback with two parameter
  ///   response  as string
  ///    info dictionary


  Future fireAutomator(Map data) async {
    try {
      //  var data = {'triggerPointName':'value'};
      await appgainPlatform
          .invokeMethod(_createfireAutomator, data)
          .then((result) {
        //add what you like here
        print(result);
        // TextFieldAlertDialog().showAlertDialog( result.toString());
        TextFieldAlertDialog().showAlertDialog("success");

      });
    } on PlatformException catch (e) {
      print(e.message);
    }
  }
//MARK: update user id

//userId (String)
//parameters Dictionary of key and value

  Future setuserId() async {
    try {
      var data = {'userId':'value'};
      await appgainPlatform
          .invokeMethod(_setUpuserId, data)
          .then((result) {
        //add what you like here
        print(result);
        // TextFieldAlertDialog().showAlertDialog( result.toString());
        TextFieldAlertDialog().showAlertDialog("success");

      });
    } on PlatformException catch (e) {
      print(e.message);
    }
  }
//MARK: logPurchaseForItem

//productName (String)
//currency (String)
//amount (String)


// Output : -  callback with two parameter
  ///   success bool   as string
  ///     error

  Future addPurchase(Map data) async {
    try {
      // var data = {'productName':'value','curruncy':'value','amount':22};
      await appgainPlatform
          .invokeMethod(_logNewPurchase, data)
          .then((result) {
        //add what you like here
        print(result);
        //TextFieldAlertDialog().showAlertDialog( result.toString());
        TextFieldAlertDialog().showAlertDialog("success");

      });
    } on PlatformException catch (e) {
      print(e.message);
    }
  }

//MARK: enableReciveNotification

//enable (String)
//type (String) one of theses values ("appPush","sms","email")


// Output : -  callback with two parameter
  ///   success bool   as string
  ///     error


  Future enableReciveNotification() async {
    try {
      var data = {'enable':true,'type':'value'};
      await appgainPlatform
          .invokeMethod(_enableReciveNotificationWith, data)
          .then((result) {
        //add what you like here
        print(result);
        // TextFieldAlertDialog().showAlertDialog( result.toString());
        TextFieldAlertDialog().showAlertDialog("success");

      });
    } on PlatformException catch (e) {
      print(e.message);
    }
  }

//MARK: createNotificationChannelForType

//item (String)
//notificationType (String) one of theses values ("appPush","sms","email","webPush")

  // var data = {'notificationType':'value','item':'value'};

// Output : -  callback with two parameter
  ///   success bool   as string
  ///     error

  Future addNotificationChannel(Map data) async {
    try {
      await appgainPlatform
          .invokeMethod(_createNotificationChannel, data)
          .then((result) {
        //add what you like here
        print(result);
        //TextFieldAlertDialog().showAlertDialog( result.toString());
        TextFieldAlertDialog().showAlertDialog("success");

      });
    } on PlatformException catch (e) {
      print(e.message);
    }
  }
//MARK: update user profile
//email (String)
//password (String)
// name (String)

// Output : -  callback with two parameter
  ///   success bool   as string
  ///     error
  ///
  Future updateUser(Map data) async {
    try {
      //var data = {'email':'value','pass':'value','username':'value'};
      await appgainPlatform
          .invokeMethod(_updateUserWith, data)
          .then((result) {
        //add what you like here
        print(result);
        //TextFieldAlertDialog().showAlertDialog( result.toString());
        TextFieldAlertDialog().showAlertDialog("success");

      });
    } on PlatformException catch (e) {
      print(e.message);
    }
  }
//MARK: log event
//type (String)
//action (String)

// Output : -  callback with two parameter
  ///   response  as string
  ///    info dictionary


  Future logEvent(Map data) async {
    try {
      await appgainPlatform
          .invokeMethod(_logEventwith, data)
          .then((result) {
        //add what you like here
        print(result);
        // TextFieldAlertDialog().showAlertDialog( result.toString());
        TextFieldAlertDialog().showAlertDialog("success");

      });
    } on PlatformException catch (e) {
      print(e.message);
    }
  }

}


