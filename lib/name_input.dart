import 'package:flutter/material.dart';
import 'package:name_shuffle_app/shuffle.dart';

class Name extends StatefulWidget {
  const Name({super.key});

  @override
  State<Name> createState() => _NameState();
}

class _NameState extends State<Name> {
  List<String> studentList = ["dfdf"];
  final TextEditingController _studentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 100,
          ),
          Center(
            child: SizedBox(
              width: 250,
              child: TextField(
                controller: _studentController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter the Student Name'),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilledButton(
                    onPressed: () {
                      setState(() {
                        studentList.add(_studentController.text);
                        _studentController.clear();
                      });
                    },
                    style: FilledButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 25)),
                    child: const Text("Add Student")),
                const SizedBox(
                  width: 20,
                ),
                FilledButton(
                    onPressed: () {
                      setState(() {});
                    },
                    style: FilledButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 25)),
                    child: const Text("Clear List")),
              ],
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  Center(child: Shuffle(
                          studentList:studentList
                        ))));
              },
              style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 36)),
              child: const Text("Shuffle")),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: Card(
              margin: const EdgeInsets.all(50),
              child: ListView.builder(
                itemCount: studentList
                    .length, // Replace with the actual number of items
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(studentList[index]),
                    // Other details for each student can be added here
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
