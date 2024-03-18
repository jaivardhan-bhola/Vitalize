import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vitalize/firebase_options.dart';
import 'package:vitalize/pages/home.dart';
import 'package:vitalize/pages/onboarding.dart';
import 'package:firebase_core/firebase_core.dart';


Future main() async {
  await Hive.initFlutter();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: Hive.openBox('user'),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container();
          } else if (Hive.box('user').isEmpty) {
            return Onboarding();
          } else {
            return Home();
          }
        },
      ),
    );
  }
}