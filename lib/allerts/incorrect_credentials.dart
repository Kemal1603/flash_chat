//--------------------- IMPORTED MODULES ---------------------//
import 'package:flutter/material.dart';


/*
This class as describe it's name is showing the alert in case if
User will enter the incorrect email or password
 */

showAlertDialog(BuildContext context) {

  // set up the button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    backgroundColor: Colors.white,
    title: Text("Incorrect Data"),
    content: Text("Please check the entered data because we don't match any"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}