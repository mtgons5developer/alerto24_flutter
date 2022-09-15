import 'package:alerto24/home/navpages/agencies/barangay.dart';
import 'package:alerto24/home/navpages/agencies/firetruck.dart';
import 'package:alerto24/home/navpages/agencies/police.dart';
import 'package:flutter/material.dart';
import '../../../main.dart';
import '../agencies/ambulance.dart';

class HelpPage extends StatefulWidget {
  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Agencies'),
            centerTitle: true,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black87],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                ),
              ),
            ),
            bottom: TabBar(
              indicatorColor: Colors.white,
              indicatorWeight: 5,
              tabs: [
                Tab(
                    icon: Icon(
                  Icons.health_and_safety,
                  color: Colors.red[900],
                  size: 40,
                )),
                Tab(
                    icon: Icon(
                  Icons.local_police,
                  size: 40,
                  color: Colors.blue[900],
                )),
                Tab(
                    icon: Icon(
                  Icons.local_activity,
                  size: 40,
                  color: Colors.green[900],
                )),
                Tab(
                    icon: Icon(
                  Icons.fire_extinguisher,
                  size: 40,
                  color: Colors.yellow[500],
                )),
              ],
            ),
            elevation: 20,
            titleSpacing: 20,
          ),
          body: TabBarView(
            children: [
              AmbulancePage(),
              PolicePage(),
              BarangayPage(),
              FireTruckPage(),
            ],
          ),
        ),
      );

  Widget buildPage(String text) => Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 28),
        ),
      );
}
