import 'package:flutter/material.dart';
import 'package:instagram/ui/home_page.dart';
import 'package:instagram/ui/messages_page.dart';
import 'package:instagram/ui/profile_page.dart';
import 'package:instagram/utils/Constants.dart';

void main() {
  runApp(const InstagramApp());
}

class InstagramApp extends StatelessWidget {
  const InstagramApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Constants.HOME,
      routes: {
        Constants.HOME: (context) => HomePage(),
        Constants.PROFILE: (context) => ProfilePage(),
        Constants.HOME: (context) => MessagesPage()
      },
    );
  }
}
