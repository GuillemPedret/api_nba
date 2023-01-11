import 'package:api_to_sqlite/src/pages/add_player.dart';
import 'package:api_to_sqlite/src/pages/modify_player.dart';
import 'package:flutter/material.dart';
import 'package:api_to_sqlite/src/pages/home_page.dart';
import 'package:api_to_sqlite/src/pages/start_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'welcome',
      routes: {
        'home': (BuildContext context) => const HomePage(),
        'welcome': (BuildContext context) => WelcomePage(),
        'add': (BuildContext context) => const AddPlayer(),
        'modify': (BuildContext context) => const ModifyPlayer(),
      },
    );
  }
}
