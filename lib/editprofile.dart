import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'cards.dart';
import 'profile.dart';

class Editprofile extends StatefulWidget {
  const Editprofile({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  // ignore: library_private_types_in_public_api
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<Editprofile> {
  bool showPassword = false;
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
            const Divider(
              thickness: 2,
              height: 60,
              color: Color.fromARGB(255, 250, 223, 103),
            ),
            const SizedBox(height: 30),
            buildTextField("Email", "$userEmail", false),
            buildTextField("Name", "$userNAME", false),
            buildTextField("Password", "", true),
            buildTextField("Phone", showwidget(), false),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 7, 7, 7),
                padding: const EdgeInsets.symmetric(horizontal: 50),
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              child: const Text(
                "SAVE",
                style: TextStyle(
                    fontSize: 14, letterSpacing: 2.2, color: Colors.white),
              ),
            )
          ],
        )),
      ),
    );
  }

  String showwidget() {
    if (FirebaseAuth.instance.currentUser?.phoneNumber == null) {
      return "PhoneNumber is Empty";
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

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: const Icon(
                      Icons.remove_red_eye,
                      color: Color.fromARGB(255, 5, 5, 5),
                    ),
                  )
                : null,
            contentPadding: const EdgeInsets.only(bottom: 3),
            labelText: labelText,
            labelStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }
}
