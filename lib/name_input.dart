import 'package:flutter/material.dart';
import 'package:name_shuffle_app/shuffle.dart';

class Name extends StatefulWidget {
  const Name({super.key});

  @override
  State<Name> createState() => _NameState();
}

class _NameState extends State<Name> {
  List<String> studentList = [];
  final TextEditingController _studentController = TextEditingController();

  void _validateStudent() {
    String studentName = _studentController.text.trim();
    if (studentName.isEmpty || studentList.contains(studentName)) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(studentName.isEmpty
                ? 'Please Enter Name !'
                : 'This name is already exists !'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      setState(() {
        studentList.add(_studentController.text);
        _studentController.clear();
      });
    }
  }

  void _clear() {
    setState(() {
      studentList.clear();
    });
  }

  void _checkList() {
    if (studentList.length < 5) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Please Enter Minimum 5 Students'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  Center(child: Shuffle(studentList: studentList))));
    }
  }

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
                        _validateStudent();
                      });
                    },
                    style: FilledButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                        textStyle: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic)),
                    child: const Text("Add Student")),
                const SizedBox(
                  width: 20,
                ),
                FilledButton(
                    onPressed: () {
                      _clear();
                    },
                    style: FilledButton.styleFrom(
                        backgroundColor: Colors.greenAccent,
                        textStyle: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic)),
                    child: const Text("Clear List")),
              ],
            ),
          ),
          ElevatedButton(
              onPressed: () {
                _checkList();
              },
              style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic)),
              child: const Text("Shuffle")),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: Card(
              margin: const EdgeInsets.all(50),
              child: ListView.builder(
                itemCount: studentList
                    .length, 
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(studentList[index]),
                   
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
