import 'package:flutter/material.dart';
import './create_user.dart';
import 'auth.dart';
import 'google_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OtherProfiles extends StatelessWidget {
  OtherProfiles({super.key});

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

//   @override
//   State<Profiles> createState() => _ProfileState();
// }

// class _ProfileState extends State<Profiles> {
  @override
  Widget build(BuildContext context) {
    final List<String> words = ["Abu", "Chizy", "Dennies", "Plinio"];
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: 600,
            height: MediaQuery.of(context).size.height * .05,
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              color: Color.fromRGBO(102, 155, 139, 1),
            ),
            child: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context)
                    .style
                    .apply(fontSizeFactor: 1.5),
                children: const <TextSpan>[
                  TextSpan(
                    text: 'Profiles',
                    style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        decoration: TextDecoration.none),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
            ),
          ),
          Container(
            height: 500,
            width: 500,
            child: ListView(
              children: words
                  .map(
                    (data) => ListTile(
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
