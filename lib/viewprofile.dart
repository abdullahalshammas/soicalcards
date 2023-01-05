import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'cards.dart';
import 'profile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Viewprofile extends StatefulWidget {
  const Viewprofile({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  // ignore: library_private_types_in_public_api
  _ViewProfileState createState() => _ViewProfileState();
}

class _ViewProfileState extends State<Viewprofile> {
  var userEmail = FirebaseAuth.instance.currentUser?.email;
  var userNAME = FirebaseAuth.instance.currentUser?.displayName;
  var userphone = FirebaseAuth.instance.currentUser?.phoneNumber;

  final _auth = FirebaseAuth.instance;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/profile.png'),
                  radius: 50,
                ),
              ),
              const SizedBox(height: 30),
              Text(
                'Welcome $userNAME',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    letterSpacing: 2,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              const Divider(
                thickness: 2,
                height: 60,
                color: Color.fromARGB(255, 250, 223, 103),
              ),
              const SizedBox(height: 30),
              const Icon(
                Icons.email,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                '$userEmail',
                style: const TextStyle(
                    color: Color.fromARGB(255, 3, 3, 3),
                    fontSize: 18,
                    letterSpacing: 1),
              ),
              const SizedBox(height: 30),
              const Icon(
                Icons.phone,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'Empty',
                style: TextStyle(
                    color: Color.fromARGB(255, 3, 3, 3),
                    fontSize: 18,
                    letterSpacing: 1),
              ),
              const SizedBox(height: 30),
              const Icon(
                Icons.location_city,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              const Text(
                'Empty',
                style: TextStyle(
                    color: Color.fromARGB(255, 3, 3, 3),
                    fontSize: 18,
                    letterSpacing: 1),
              ),
              const SizedBox(height: 30),
              const Icon(
                Icons.work,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              const Text(
                'Empty',
                style: TextStyle(
                    color: Color.fromARGB(255, 3, 3, 3),
                    fontSize: 18,
                    letterSpacing: 1),
              ),
              const SizedBox(height: 30),
              const Icon(
                Icons.lightbulb,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              const Text(
                'Empty',
                style: TextStyle(
                    color: Color.fromARGB(255, 3, 3, 3),
                    fontSize: 18,
                    letterSpacing: 1),
              ),
              const SizedBox(height: 30),
              const Icon(
                Icons.sports_football,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              const Text(
                'Empty',
                style: TextStyle(
                    color: Color.fromARGB(255, 3, 3, 3),
                    fontSize: 18,
                    letterSpacing: 1),
              ),
              const SizedBox(height: 30),
              const Icon(
                FontAwesomeIcons.twitter,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              const Text(
                'Empty',
                style: TextStyle(
                    color: Color.fromARGB(255, 3, 3, 3),
                    fontSize: 18,
                    letterSpacing: 1),
              ),
              const SizedBox(height: 30),
              const Icon(
                FontAwesomeIcons.instagram,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              const Text(
                'Empty',
                style: TextStyle(
                    color: Color.fromARGB(255, 3, 3, 3),
                    fontSize: 18,
                    letterSpacing: 1),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String showwidget() {
    if (FirebaseAuth.instance.currentUser?.phoneNumber == null) {
      return "Phone was not added";
    } else {
      return '$userphone';
    }
  }

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: const Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            const Text('Back',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }
}
