//--------------------- IMPORTED MODULES ---------------------//
import 'package:flash_chat/extractedWidgets/commonPaddingWidget.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

//--------------------- MAIN PAGE WIDGET ---------------------//

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}
/*
The mixin SingleTickerProviderStateMixin is need for animation
when we call "vsync" property of AnimationController
*/
class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {

  AnimationController controller;
  String mainText = 'Flash Chat';

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    controller.forward(); // 0...1...2 Duration(seconds: 2)

    // Handling and catching any changes and change it's own value
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
            /**
            Hero is the special Class for animation that is going to start
            from here and increase it's size in the chosen page
             */

            Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 55.0,
                  ),
                ),
                //AnimatedTextKit is Additional plugin from pub.dev
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Franko Favori',
                      speed: Duration(milliseconds: 250),
                      textStyle: TextStyle(
                        color: Colors.black.withOpacity(controller.value),
                        fontSize: 45.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              color: Colors.lightBlue,
              action: () {
                Navigator.pushNamed(context, '/login_screen');
              },
              text: Text('Log In'),
            ),
            RoundedButton(
              color: Colors.blueAccent,
              action: () {
                Navigator.pushNamed(context, '/registration_screen');
              },
              text: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
