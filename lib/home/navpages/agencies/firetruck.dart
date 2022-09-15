// import 'package:alerto24/home/navpages/task/task_update.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class FireTruckPage extends StatefulWidget {
  const FireTruckPage({Key? key}) : super(key: key);

  @override
  State<FireTruckPage> createState() => _FetchDataState();
}

class _FetchDataState extends State<FireTruckPage> {
  Query dbRef = FirebaseDatabase.instance.ref().child('tasks');
  DatabaseReference reference = FirebaseDatabase.instance.ref().child('tasks');

  Widget listItem({required Map task}) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
      height: 70,
      color: Colors.blue.shade200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Fire Station:",
              textAlign: TextAlign.center,
              // task['assignedTo'],
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          SizedBox(
            width: 10,
          ),
          Text("Location:",
              // Text(task['category'],
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          SizedBox(
            width: 10,
          ),
          Text("Distance:",
              // Text(task['createdBy'],
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
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
