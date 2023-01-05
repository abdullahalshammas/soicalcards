import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'cards.dart';
import 'editprofile.dart';
import 'viewprofile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  // ignore: library_private_types_in_public_api
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<ProfilePage> {
  int _currentindex = 0;
  final screens = [
    const Viewprofile(),
    const Editprofile(),
  ];
  var userEmail = FirebaseAuth.instance.currentUser?.email;
  var userNAME = FirebaseAuth.instance.currentUser?.displayName;
  var userphone = FirebaseAuth.instance.currentUser?.phoneNumber;

  final _auth = FirebaseAuth.instance;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor:
            const Color.fromARGB(255, 250, 223, 103), //<-- SEE HERE
      ),
      key: _scaffoldKey,
      body: screens[_currentindex],
      bottomNavigationBar: Theme(
        data: ThemeData(
          canvasColor: const Color.fromARGB(255, 250, 223, 103),
        ),
        child: BottomNavigationBar(
          selectedFontSize: 15,
          currentIndex: _currentindex,
          selectedItemColor: const Color.fromARGB(255, 2, 2, 2),
          unselectedItemColor: Colors.grey,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.visibility),
              label: 'View Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.edit),
              label: 'Edit Profile',
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentindex = index;
            });
          },
        ),
      ),
    );
  }
}
