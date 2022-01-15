import 'package:flutter/material.dart';
import 'package:simple_weather/screens/loading_screen.dart';

void main() {
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        body: LoadingScreen(),
      ),
    );
  }
}
