import 'package:flutter/material.dart';

import 'Appgain.dart';


BuildContext  rootContext;


class TextFieldAlertDialog  {
  TextEditingController _textFieldController = TextEditingController();
  TextEditingController _textFieldController2 = TextEditingController();
  TextEditingController _textFieldController3 = TextEditingController();
  TextEditingController _textFieldController4 = TextEditingController();

  displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Init Sdk'),

            content: //<Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _textFieldController,
                    textInputAction: TextInputAction.go,
                    // labelText: Text('5fc8a0838f7a96000cda8dda'),
                    //  keyboardType: TextInputType.text(),
                    decoration: InputDecoration(hintText: "App id"),
                  ),
                  TextField(
                    controller: _textFieldController2,
                    textInputAction: TextInputAction.go,
                    //  keyboardType: TextInputType.text(),
                    decoration: InputDecoration(hintText: "Api key"),
                  ),
                ],

              ),

            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('OK'),
                onPressed: () {
                  print(_textFieldController.value.text);
                  var data =  {'appId':_textFieldController.value.text,'apiKey':_textFieldController2.value.text,'configure':true};

                  Appgain().initAppgainSDK(data);
                  print(_textFieldController2.value.text);

                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }



  displaytriggerPointDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Fire automater for '),

            content: //<Widget>[

            TextField(
              controller: _textFieldController,
              textInputAction: TextInputAction.go,
              //  keyboardType: TextInputType.text(),
              decoration: InputDecoration(hintText: "trigger point name"),
            ),



            actions: <Widget>[
              new FlatButton(
                child: new Text('OK'),
                onPressed: () {
                  var data = {'triggerPointName':_textFieldController.value.text};

                  Appgain().fireAutomator(data);
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }


  displayShowEmailDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Create notification channel'),

            content: //<Widget>[

            TextField(
              controller: _textFieldController,
              textInputAction: TextInputAction.go,
              //  keyboardType: TextInputType.text(),
              decoration: InputDecoration(hintText: "enter email"),
            ),



            actions: <Widget>[
              new FlatButton(
                child: new Text('OK'),
                onPressed: () {
                  var data = {'notificationType':'email','item':_textFieldController.value.text};

                  Appgain().addNotificationChannel(data);
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
  displayShowSMSDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Create notification channel'),

            content: //<Widget>[

            TextField(
              controller: _textFieldController,
              textInputAction: TextInputAction.go,
              //  keyboardType: TextInputType.text(),
              decoration: InputDecoration(hintText: "enter mobile number"),
            ),



            actions: <Widget>[
              new FlatButton(
                child: new Text('OK'),
                onPressed: () {
                  var data = {'notificationType':'SMS','item':_textFieldController.value.text};

                  Appgain().addNotificationChannel(data);
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
  displaytriggerWithValuesDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Trigger with parameter'),

            content: //<Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _textFieldController,
                    textInputAction: TextInputAction.go,
                    //  keyboardType: TextInputType.text(),
                    decoration: InputDecoration(hintText: "trigger point name"),
                  ),
                  TextField(
                    controller: _textFieldController2,
                    textInputAction: TextInputAction.go,
                    //  keyboardType: TextInputType.text(),
                    decoration: InputDecoration(hintText: "name"),
                  ),

                  TextField(
                    controller: _textFieldController3,
                    textInputAction: TextInputAction.go,
                    //  keyboardType: TextInputType.text(),
                    decoration: InputDecoration(hintText: "value"),
                  ),
                ],

              ),

            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('OK'),
                onPressed: () {
                  var data = {'triggerPointName':_textFieldController.value.text,'personalizationMap':{_textFieldController2.value.text:_textFieldController3.value.text}};

                  Appgain().fireAutomatorWithPersonalization(data);

                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }




  displayLogPurshaceDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Add Purchase'),

            content: //<Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _textFieldController,
                    textInputAction: TextInputAction.go,
                    //  keyboardType: TextInputType.text(),
                    decoration: InputDecoration(hintText: "product name"),
                  ),

                  TextField(
                    controller: _textFieldController2,
                    textInputAction: TextInputAction.go,
                    //  keyboardType: TextInputType.text(),
                    decoration: InputDecoration(hintText: "amount"),
                  ),
                  TextField(
                    controller: _textFieldController3,
                    textInputAction: TextInputAction.go,
                    //  keyboardType: TextInputType.text(),
                    decoration: InputDecoration(hintText: "currency"),
                  ),

                ],

              ),

            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('OK'),
                onPressed: () {

                  var data = {'productName':_textFieldController.value.text,'curruncy':_textFieldController3.value.text, 'amount':_textFieldController2.value.text};

                  Appgain().addPurchase(data);

                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  displayUpdateUserDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('update user'),

            content: //<Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _textFieldController,
                    textInputAction: TextInputAction.go,
                    //  keyboardType: TextInputType.text(),
                    decoration: InputDecoration(hintText: "email"),
                  ),

                  TextField(
                    controller: _textFieldController2,
                    textInputAction: TextInputAction.go,
                    //  keyboardType: TextInputType.text(),
                    decoration: InputDecoration(hintText: "phone"),
                  ),
                  TextField(
                    controller: _textFieldController3,
                    textInputAction: TextInputAction.go,
                    //  keyboardType: TextInputType.text(),
                    decoration: InputDecoration(hintText: "field one"),
                  ),
                  TextField(
                    controller: _textFieldController4,
                    textInputAction: TextInputAction.go,
                    //  keyboardType: TextInputType.text(),
                    decoration: InputDecoration(hintText: "field two"),
                  ),
                ],

              ),

            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('OK'),
                onPressed: () {
                  var data = {'userEmail':_textFieldController.value.text,'phone':_textFieldController2.value.text,'updatedField1':_textFieldController3.value.text,'updatedField2':_textFieldController4.value.text};


                  Appgain().updateUser(data);

                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }



  displayLogEventDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Log event'),

            content: //<Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _textFieldController,
                    textInputAction: TextInputAction.go,
                    //  keyboardType: TextInputType.text(),
                    decoration: InputDecoration(hintText: "Type"),
                  ),

                  TextField(
                    controller: _textFieldController2,
                    textInputAction: TextInputAction.go,
                    //  keyboardType: TextInputType.text(),
                    decoration: InputDecoration(hintText: "action"),
                  ),
                  TextField(
                    controller: _textFieldController3,
                    textInputAction: TextInputAction.go,
                    //  keyboardType: TextInputType.text(),
                    decoration: InputDecoration(hintText: "key"),
                  ),
                  TextField(
                    controller: _textFieldController4,
                    textInputAction: TextInputAction.go,
                    //  keyboardType: TextInputType.text(),
                    decoration: InputDecoration(hintText: "value"),
                  ),
                ],

              ),

            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('OK'),
                onPressed: () {

                  var data = {'type':_textFieldController.value.text,'action':_textFieldController2.value.text,'extra':{_textFieldController3.value.text:_textFieldController4.value.text}};

                  Appgain().logEvent(data);

                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }






  showAlertDialog(String message) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(rootContext).pop();

      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(""),
      content: Text(message),
      actions: [
        okButton,
      ],
    );
    // show the dialog
    showDialog(
      context: rootContext,
      builder: (rootContext) {
        return alert;
      },
    );
  }

}
