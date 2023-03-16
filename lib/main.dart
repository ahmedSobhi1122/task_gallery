import 'package:flutter/material.dart';
import 'package:gallerytask/home_page.dart';

void main() async {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "REST API_json_place holder",
      home: Home_Page(),
    );
  }
}
