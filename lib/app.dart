import 'package:flutter/material.dart';
import 'package:name_shuffle_app/home.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
       body: Container(
        decoration: const BoxDecoration(
          color: Colors.lightBlue
        ),
      child: const Column(
        children: [
          Center(
            child: Home(),
          )
        ],
      ),
       ),
      ),
    );
  }
}