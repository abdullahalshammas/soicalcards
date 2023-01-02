import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'loginPage.dart';
import 'Profile.dart';

class CardsPage extends StatefulWidget {
  const CardsPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  // ignore: library_private_types_in_public_api
  _CardsState createState() => _CardsState();
}

class _CardsState extends State<CardsPage> {
  int _currentindex = 0;
  final _auth = FirebaseAuth.instance;
  late var userEmail = FirebaseAuth.instance.currentUser?.email;
  late var userNAME = FirebaseAuth.instance.currentUser?.displayName;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Cards',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor:
            const Color.fromARGB(255, 250, 223, 103), //<-- SEE HERE
      ),
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage("images/profile.png"),
              ),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/color.png"),
                  fit: BoxFit.fill,
                ),
              ),
              accountName: Text(
                'Welcome $userNAME',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              accountEmail: Text(
                '$userEmail',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.add_card,
              ),
              title: const Text(
                'Cards',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const CardsPage()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.account_box,
              ),
              title: const Text(
                'Profile',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfilePage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text(
                'Logout',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              onTap: () {
                _auth.signOut();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Stack(),
      ),
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
              icon: Icon(Icons.edit),
              label: 'Edit Cards',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.folder_delete),
              label: 'Delete Cards',
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
