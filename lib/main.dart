import 'package:flutter/material.dart';
import 'package:lafyu/src/ui/auth/login_screen.dart';
import 'package:lafyu/src/ui/auth/splash_screen.dart';
import 'package:lafyu/src/ui/menu/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        platform: TargetPlatform.iOS,
        primarySwatch: Colors.blue,
      ),
      home:   SplashScreen(


      ),
    );
  }
}
