import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_app/user_profile.dart';
import './create_user.dart';
import 'auth.dart';
import 'google_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'create_cards.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:core';

class MyPainterwhite extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Color.fromRGBO(241, 241, 248, 1).withOpacity(1);

    final center = Offset(size.width / 2, size.height / 4.5);
    canvas.drawCircle(center, size.width / 1.8, paint);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return true;
  }
}

class OtherProfiles extends StatefulWidget {
  OtherProfiles({super.key});

  get setState => null;

  @override
  State<OtherProfiles> createState() => _OtherProfileState();
}

class _OtherProfileState extends State<OtherProfiles> {
  Map dataMap = {};
  List dataList = [];

  Future<void> getData() async {
    //replace your restFull API here.
    String url =
        "https://us-central1-group-project-2-16d40.cloudfunctions.net/getData/allUsers";
    final response = await http.get(Uri.parse(url));

    dataMap = json.decode(response.body);

    setState(() {
      dataList = dataMap["usr"];
    });
  }

  @override
  void initState() {
    super.initState();
    getData();

    // Or call your function here
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signOut(BuildContext context) async {
    if (_auth.currentUser != null) {
      await Authentication().signOut();

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Login(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<String> profiles = [];
    var profilelength = profiles.length;

    for (var person in dataList) {
      profiles.add(person["name"]);
    }

    return Scaffold(
      backgroundColor: const Color.fromRGBO(102, 155, 139, 1),
      body: Column(
        children: [
          Stack(
            children: <Widget>[
              Container(
                color: const Color.fromRGBO(241, 241, 248, 1),
                width: 400,
                height: 250,
                child: CustomPaint(
                  painter: MyPainterwhite(),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 100.0),
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('images/cardio.png'),
                          fit: BoxFit.fill),
                    ),
                  ),
                ),
              )
            ],
          ),
          Container(
            height: 300,
            width: 300,
            child: ListView(
              children: profiles
                  .map(
                    (data) => ListTile(
                      title: Align(
                        alignment: Alignment.center,
                        child: Text(
                          data,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Color.fromRGBO(241, 241, 248, 1),
                          ),
                        ),
                      ),
                      onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileScreen(
                              userprofile: data,
                            ),
                          ),
                        ),
                      },
                    ),
                  )
                  .toList(),
            ),
          ),
          // Container(
          //   height: 100,
          //   width: 500,
          //   child: TextButton(
          //     style: ButtonStyle(
          //       foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          //     ),
          //     onPressed: () async {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => const CreateUser(),
          //         ),
          //       );
          //     },
          //     child: const Text(
          //       'Add Your Own Profile',
          //       style: TextStyle(
          //         decoration: TextDecoration.underline,
          //         color: Color.fromRGBO(241, 241, 248, 1),
          //         fontSize: 20,
          //       ),
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Container(
              width: MediaQuery.of(context).size.width / 2.75,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: const Color.fromRGBO(241, 241, 248, 1),
              ),
              child: MaterialButton(
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CreateCards(),
                    ),
                  );
                },
                child: const Text(
                  "Create a card",
                  style: TextStyle(
                    color: Color.fromRGBO(102, 155, 139, 1),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Container(
              width: MediaQuery.of(context).size.width / 2.75,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: const Color.fromRGBO(241, 241, 248, 1),
              ),
              child: MaterialButton(
                onPressed: () {
                  signOut(context);
                },
                child: const Text(
                  "Logout",
                  style: TextStyle(
                    color: Color.fromRGBO(102, 155, 139, 1),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
