import 'package:dadoscovid/pages/home/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dados covid',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: HomePage(),
    );
  }
}
