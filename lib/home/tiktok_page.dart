import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import '../widgets/big_text.dart';
// import '../widgets/small_text.dart';
import 'navpages/help/help_page.dart';
import 'navpages/homepage/home_page.dart';
import 'navpages/profile/profile_page.dart';
import 'navpages/recording/recording_page.dart';
import 'navpages/task/task_page.dart';

class TiktokPage extends StatefulWidget {
  const TiktokPage({Key? key}) : super(key: key);

  @override
  _TiktokPageState createState() => _TiktokPageState();
}

class _TiktokPageState extends State<TiktokPage> {
  List pages = [
    HomePage(),
    TaskPage(),
    HelpPage(),
    RecordingPage(),
    ProfilePage()
  ];
  int currentIndex = 2;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: pages[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          unselectedFontSize: 0,
          selectedFontSize: 0,
          onTap: onTap,
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 40.0),
              label: '0',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.task, size: 40.0),
              label: '1',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.emergency,
                size: 40.0,
                color: Colors.red[900],
              ),
              label: '2',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.cloud_upload, size: 40.0),
              label: '3',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 40.0),
              label: '4',
            ),
          ],
        ),
      );
}
