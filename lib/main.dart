import 'package:emmthaan/provider/new_provider.dart';
import 'package:emmthaan/screen/new_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'providers/prayer_provider.dart';
// import 'screens/home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => newprovider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prayer App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: newscreen(),
    );
  }
}