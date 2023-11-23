import 'package:flutter/material.dart';
import 'package:name_shuffle_app/name_input.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 250,
        ),
        const Text(
          "iCET",
          style: TextStyle(
              fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const Text(
          "Name Shuffle",
          style: TextStyle(
              fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(
          height: 100,
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const Center(child: Name())));
            },
            style: ElevatedButton.styleFrom(
                 textStyle: const TextStyle(fontSize: 25)),
            child: const Text("Get Started"))
      ],
    );
  }
}
