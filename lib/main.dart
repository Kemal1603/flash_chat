//--------------------- IMPORTED MODULES ---------------------//

import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';

//--------------------- MAIN FUNCTION ---------------------//

/* WE NEED ASYNC ON MAIN FUNCTION BECAUSE OF
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();*/

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FlashChat());
}


//--------------------- MAIN APP CLASS ---------------------//

/*
There is two ways of setting the routes key:
1) String -> (context)=> Referenced class(screen)
2) Via static method of screen which is basically the same
 */
class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      initialRoute: '/welcome_screen',
      routes: {
        '/chat_screen': (context)=> ChatScreen(),
        '/login_screen': (context)=> LoginScreen(),
        '/registration_screen': (context)=> RegistrationScreen(),
        '/welcome_screen': (context)=> WelcomeScreen(),

      },
    );
  }
}
