import 'package:flutter/material.dart';
import 'package:jussurapp/Screens/webview_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
    return MaterialApp(
      home: SplashScreen(
        seconds: 3,
        navigateAfterSeconds: WebViewScreen(),
        photoSize: 100,
        image: Image.asset('assets/image/JE-logo.png',
        ),
        backgroundColor: Color(0xFF23678A),
        loaderColor: Colors.transparent,
      )
    );
  }
}

