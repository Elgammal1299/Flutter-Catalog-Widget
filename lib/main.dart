import 'package:flutter/material.dart';
import 'package:flutter_catalog_widget/Date%20and%20Time/date_picker.dart';
import 'package:flutter_catalog_widget/NavRail%20Example/nav_rail_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MyDatePicker(),
    );
  }
}
