//--------------------- IMPORTED MODULES ---------------------//

import 'package:flash_chat/allerts/incorrect_credentials.dart';
import 'package:flash_chat/constants/constants.dart';
import 'package:flash_chat/extractedWidgets/commonPaddingWidget.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';



//--------------------- LOGIN PAGE ---------------------//

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email;
  String password;
  final _auth = FirebaseAuth.instance; //Applying _auth as an instance of FirebaseAuth
  bool showSpinner = false;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      /*
      Below we wrap the body Padding widget with ModalProgressHUD. This is
      imported plugin for circle Progress button with special features
      and this widget has required parameter inAsyncCall which can be either
      true or false depend on our needs
       */
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              /*
              In this page the logo increase it's own size from welcome_screen
              to login_screen. From height: 55.0, to height: 140.0,
              */
              Hero(
                tag: 'logo',
                child: Container(
                  height: 140.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                decoration: kInputDecoration.copyWith(hintText: 'Enter Your Email'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
                },
                decoration: kInputDecoration.copyWith(hintText: 'Enter Your password'),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                text: Text('Log In'),
                action: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  /*
                  Here we are trying to SIGN IN via _auth.signInWithEmailAndPassword
                  in case if Signage will finish successfully User'll be able
                  to redirect to chat_screen
                  */
                  try{
                    final loggedUser = await _auth.signInWithEmailAndPassword(email: email, password: password);
                    if (!loggedUser.additionalUserInfo.isNewUser){
                      Navigator.pushNamed(context, '/chat_screen');
                    }
                    setState(() {
                      showSpinner = false;
                    });
                  }
                  catch (e){
                    setState(() {
                      showSpinner = false;
                    });
                    showAlertDialog(context);

                  }
                },
                color: Colors.lightBlueAccent,
              )

            ],
          ),
        ),
      ),
    );
  }
}
