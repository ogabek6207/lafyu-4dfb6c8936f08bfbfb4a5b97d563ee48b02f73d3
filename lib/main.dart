import 'package:flutter/material.dart';
import 'package:lafyu/src/ui/auth/forgot_password_screen.dart';
import 'package:lafyu/src/ui/auth/new_password_screen.dart';
import 'package:lafyu/src/ui/category/more_category_screen.dart';
import 'package:lafyu/src/ui/home/home_screen.dart';
import 'package:lafyu/src/ui/main_screen.dart';
import 'package:lafyu/src/ui/notification/notification_screen.dart';
import 'package:lafyu/src/ui/search/search_screen.dart';
import 'package:lafyu/src/ui/splash/splash_screen.dart';

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
      home: const MainScreen(),
    );
  }
}
