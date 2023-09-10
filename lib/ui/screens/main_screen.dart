import 'package:flutter/material.dart';


class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);
  static const screenId = '/main_screen' ;
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
    );
  }
}