import 'package:flutter/material.dart';
import 'package:shop_app_project/data/apis_helper.dart';
import 'package:shop_app_project/presentation/homeEgyptScreen.dart';

void main() {
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  HomeEgyptSceen(),
    );
  }
}

