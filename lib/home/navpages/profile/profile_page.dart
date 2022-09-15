import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../auth/firebase_auth_methods.dart';
import '../../widgets/custom_button.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? first = '';
  String? middle = '';
  String? surname = '';
  String? suffix = '';
  // age/sex/e.contact-Relationship-contactnum/pre-existing conditions/marital status
  //Family Doctor Name-e.contact/Taking any medications, currently? Yes/No, If yes, please list it here
  //Pre-existing conditions: Pregnancy/AIDS/HIV/Congestive Heart Failure/Hypertension/Epilepsy
  //A pre-existing condition is a health problem you had before the date that your new health coverage starts. Epilepsy, cancer, diabetes, lupus, sleep apnea, and pregnancy are all examples of pre-existing conditions.
  String? email = '';
  String? image = '';
  String? cpnum = '';
  String? hinsurance = '';
  String? contractnum = '';

  String? address = '';
  String? barangay = '';
  String? municipality = '';
  String? province = '';
  String? country = '';
  String? postal = '';
  String? latitude = '';
  String? longitude = '';

  Future _getDataFromDatabase() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((snapshot) async {
      if (snapshot.exists) {
        setState(() {
          snapshot.data()!["first"];
          snapshot.data()!["middle"];
          snapshot.data()!["surname"];
          snapshot.data()!["suffix"];
          snapshot.data()!["email"];
          snapshot.data()!["image"];
          snapshot.data()!["cpnum"];
          snapshot.data()!["hinsurance"];
          snapshot.data()!["contractnum"];

          snapshot.data()!["address"];
          snapshot.data()!["barangay"];
          snapshot.data()!["municipality"];
          snapshot.data()!["province"];
          snapshot.data()!["country"];
          snapshot.data()!["postal"];
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = context.read<FirebaseAuthMethods>().user;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(
            onTap: () {
              context.read<FirebaseAuthMethods>().signOut(context);
            },
            text: 'Sign Out',
          ),
        ],
      ),
    );
  }
}
