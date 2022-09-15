// import 'package:alerto24/home/navpages/task/task_update.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class PolicePage extends StatefulWidget {
  const PolicePage({Key? key}) : super(key: key);

  @override
  State<PolicePage> createState() => _FetchDataState();
}

class _FetchDataState extends State<PolicePage> {
  Query dbRef = FirebaseDatabase.instance.ref().child('tasks');
  DatabaseReference reference = FirebaseDatabase.instance.ref().child('tasks');

  Widget listItem({required Map task}) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
      height: 70,
      color: Colors.blue.shade200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("TEXT",
              // task['assignedTo'],
              style: TextStyle(fontSize: 8, fontWeight: FontWeight.w400)),
          const SizedBox(
            height: 5,
          ),
          Text(task['category'],
              style: TextStyle(fontSize: 8, fontWeight: FontWeight.w400)),
          const SizedBox(
            height: 5,
          ),
          Text(task['createdBy'],
              style: TextStyle(fontSize: 8, fontWeight: FontWeight.w400)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      child: FirebaseAnimatedList(
        query: dbRef,
        itemBuilder: (BuildContext context, DataSnapshot snapshot,
            Animation<double> animation, int index) {
          Map task = snapshot.value as Map;
          task['key'] = snapshot.key;

          return listItem(task: task);
        },
      ),
    ));
  }
}
