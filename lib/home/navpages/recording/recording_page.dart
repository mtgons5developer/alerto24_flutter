import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecordingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Recording Page",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: Center(
          child: Text(
            "Recording Page",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
