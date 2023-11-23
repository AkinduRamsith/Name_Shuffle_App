import 'dart:math';

import 'package:flutter/material.dart';
import 'package:name_shuffle_app/app.dart';

class Shuffle extends StatefulWidget {
  final List<String> studentList;
  const Shuffle({super.key, required this.studentList});

  

  @override
  State<Shuffle> createState() => _ShuffleState();
}

class _ShuffleState extends State<Shuffle> {
  List<List<String>> shuffledStudent() {
    List<String> shuffleName=List.from(widget.studentList)..shuffle();
    List<List<String>> groups = [];

    int cardCount=(widget.studentList.length/5).ceil();
    int current=0;
    for (int i = 0; i < cardCount; i++) {
      int size=min(5, shuffleName.length-current);
       if (size <=3) {
         int remainingSize = min(5 - size, shuffleName.length - current);
       for (int j = 0; j < remainingSize; j++) {
          while (current<shuffleName.length) {
            int random=Random().nextInt(cardCount-1);
            groups[random].add(shuffleName[current++]);
          // List<String> remainingGroup =
          //     shuffleName.sublist(current, current + remainingSize);
          // groups.add(remainingGroup);
          // current += remainingSize;
           size += remainingSize;
        }
       }
       
      } else {
        List<String> group = shuffleName.sublist(current, current + size);
        current += size;
        groups.add(group);
      }
    }
    return groups;
  }
  late List<List<String>> groups;

  @override
  void initState() {
    super.initState();
    groups = shuffledStudent();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
      ),
      body:SingleChildScrollView( 
      child:Column(
        children: [
         
          for (int i = 0; i < groups.length; i++)
          Padding(
            padding: const EdgeInsets.all(10),
            child:Card(
          
              
              child: ListTile(
                title: Text('Group ${i + 1}'),
                subtitle: Text(groups[i].join('\n'),style: const TextStyle(fontSize: 20),),
              ),
            ),
      ),
        ],
      ),
    ),
    );
  }
}
