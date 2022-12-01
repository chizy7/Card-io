import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_app/profiles.dart';
import 'services/flutterfire.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'create_user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

Future<http.Response> postUser(email, name) {
  return http.post(
    Uri.parse(
        'https://us-central1-group-project-2-16d40.cloudfunctions.net/postUser/addUser'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'usrID': '4',
      'email': 'test ',
      'name': 'test',
      'bio': '',
      'fav_topic': ''
    }),
  );
}

class _RegisterState extends State<Register> {
  final TextEditingController _emailField = TextEditingController();
  final TextEditingController _passwordField = TextEditingController();
  final TextEditingController _firstname = TextEditingController();
  final TextEditingController _lastname = TextEditingController();
  var email;
  var name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: <Widget>[
      Stack(children: <Widget>[
        Container(
            color: const Color.fromRGBO(241, 241, 248, 1),
            width: 400,
            height: 450,
            child: CustomPaint(
              painter: MyPainterTall(),
            )),
        Center(
            child: Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Container(
                    width: 300,
                    height: 300,
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                          image: AssetImage('images/cardio.png'),
                          fit: BoxFit.fill),
                    ))))
      ]),
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * .45,
        color: const Color.fromRGBO(244, 244, 249, 1),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: <
            Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 50.0, right: 220.0, left: 20.0),
            child: RichText(
                text: TextSpan(
                    style: DefaultTextStyle.of(context)
                        .style
                        .apply(fontSizeFactor: .55),
                    children: const <TextSpan>[
                  TextSpan(
                      text: 'Sign Up to get started!',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Color.fromRGBO(237, 199, 192, 1),
                          decoration: TextDecoration.none)),
                ])),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 5.0, bottom: 5.0, left: 20.0, right: 20.0),
            child: Row(children: <Widget>[
              Expanded(
                child: TextFormField(
                    controller: _firstname,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1,
                              color: Color.fromRGBO(102, 155, 139, 1))),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Enter your first name",
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      labelText: "First Name",
                      labelStyle: TextStyle(
                        color: Color.fromRGBO(102, 155, 139, 1),
                      ),
                    )),
              ),
              Expanded(
                child: TextFormField(
                    controller: _lastname,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1,
                              color: Color.fromRGBO(102, 155, 139, 1))),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Enter your last name",
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      labelText: "Last Name",
                      labelStyle: TextStyle(
                        color: Color.fromRGBO(102, 155, 139, 1),
                      ),
                    )),
              )
            ]),
          ),
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <
              Widget>[
            Padding(
              padding:
                  const EdgeInsets.only(bottom: 5.0, left: 20.0, right: 20.0),
              //EMAIL TEXTFIELD
              child: TextFormField(
                controller: _emailField,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: Color.fromRGBO(102, 155, 139, 1))),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Enter your email",
                  hintStyle: TextStyle(
                    color: Colors.black,
                  ),
                  labelText: "Email",
                  labelStyle: TextStyle(
                    color: Color.fromRGBO(102, 155, 139, 1),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              //PASSWORD TEXTFIELD
              child: TextFormField(
                controller: _passwordField,
                obscureText: true,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: Color.fromRGBO(102, 155, 139, 1))),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Enter your password",
                  hintStyle: TextStyle(
                    color: Colors.black,
                  ),
                  labelText: "Password",
                  labelStyle: TextStyle(
                    color: Color.fromRGBO(102, 155, 139, 1),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 1.0), // change top back to 15
              child: RichText(
                  text: TextSpan(
                      style: const TextStyle(
                        color: Color.fromRGBO(102, 155, 139, 1),
                        decoration: TextDecoration.underline,
                        fontSize: 15.0,
                      ),
                      text: "Register",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          bool shouldNavigate = await register(
                              _emailField.text, _passwordField.text);
                          if (shouldNavigate) {
                            FirebaseFirestore.instance.collection('users').add({
                              'first': _firstname.text,
                              'last': _lastname.text,
                              'email': _emailField.text,
                            });
                            setState(() {
                              name = _firstname.text;
                              email = _emailField.text;
                            });
                            postUser(email, name);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Profiles(),
                                ));
                          }
                        })),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: RichText(
                  text: TextSpan(
                      style: const TextStyle(
                        color: Color.fromRGBO(102, 155, 139, 1),
                        decoration: TextDecoration.underline,
                        fontSize: 15.0,
                      ),
                      text: "Cancel",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pop(context);
                        })),
            ),
          ])
        ]),
      )
    ]));
  }
}
