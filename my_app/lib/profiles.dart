import 'package:flutter/material.dart';
import './create_user.dart';
import 'auth.dart';
import 'google_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'create_cards.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:core';


// class UserData {
//   final int usrId;
//   final String email;
//   final String name;
//   final String bio;
//   final String fav_topic;
  
//   UserData({
//     this.usrId,
//     this.email,
//     this.name,
//     this.bio,
//     this.fav_topic
//   });
// }


// Future getRequest() async {
//     //replace your restFull API here.
//     String url = "https://us-central1-group-project-2-16d40.cloudfunctions.net/getData/allUsers";
//     final response = await http.get(Uri.parse(url));
  
//     debugPrint(response.body);
   
//   }


class Profiles extends StatelessWidget {
  Profiles({super.key});
  get setState => null;

  final FirebaseAuth _auth = FirebaseAuth.instance;
    Map dataMap = {};
    List dataList = [];
    Future<void> getData() async {
    //replace your restFull API here.
    String url = "https://us-central1-group-project-2-16d40.cloudfunctions.net/getData/allUsers";
    final response = await http.get(Uri.parse(url));
    
    dataMap = json.decode(response.body);
    dataList = dataMap["usr"];
    this.setState(() {
        debugPrint(dataList.toString());
    });
    // return dataList;
    }
    
    @override
    void initState(){
        this.getData();
    }
   
  

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

//   @override
//   State<Profiles> createState() => _ProfileState();
// }

// class _ProfileState extends State<Profiles> {
  @override
  Widget build(BuildContext context) {
    final List<String> profiles = ["Hello", "Cool"];

    // userData.forEach((name){
    //     debugPrint(name["name"].toString());
    //     profiles.add(name["name"]);
    // });

    // debugPrint(profiles.toString());
    
    return Scaffold(
        body: Column(children: [
      Container(
          width: 600,
          height: MediaQuery.of(context).size.height * .25,
          decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            color: Color.fromRGBO(102, 155, 139, 1),
          ),
          child: RichText(
              text: TextSpan(
            style:
                DefaultTextStyle.of(context).style.apply(fontSizeFactor: 1.5),
            children: const <TextSpan>[
              
                TextSpan(
                  text: 'Profiles',
                  style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      decoration: TextDecoration.none)),
              
              
            ],
          ))),
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Container(
              decoration: const BoxDecoration(
            color: Colors.white,
          ))),
      Container(
          height: 500,
          width: 500,
          child: ListView(
            children: profiles
                .map((data) => ListTile(
                      title: Align(
                        alignment: Alignment.center,
                        child: Text(
                          data,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Color(0xff11b719),
                          ),
                        ),
                      ),
                      onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "$data",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Color(0xff11b719),
                            ),
                          ),
                          duration: const Duration(seconds: 2),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          Container(
            height: 100,
            width: 500,
            child: TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CreateCards(),
                  ),
                );
              },
              child: const Text(
                'Add Your Own Profile',
                style: TextStyle(
                  fontSize: 20,
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
                color: const Color.fromRGBO(102, 155, 139, 1),
              ),
              child: MaterialButton(
                onPressed: () {
                  signOut(context);
                },
                child: const Text(
                  "Logout",
                  style: TextStyle(
                    color: Color.fromRGBO(244, 244, 249, 1),
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

