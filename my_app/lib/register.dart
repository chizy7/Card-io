import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_app/profiles.dart';
import 'auth.dart';
import 'services/flutterfire.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import '../app/services/firebase_auth_service.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _emailField = TextEditingController();
  final TextEditingController _passwordField = TextEditingController();
  final TextEditingController _firstname = TextEditingController();
  final TextEditingController _lastname = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: <Widget>[
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * .55,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(102, 155, 139, 1),
        ),
        child: Image.asset(
          height: 100,
          width: 100,
          'images/leaflet.png',
        ),
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * .45,
        color: const Color.fromRGBO(244, 244, 249, 1),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.only(top: 50.0, right: 220.0, left: 20.0),
                child: RichText(
                    text: TextSpan(
                        style: DefaultTextStyle.of(context)
                            .style
                            .apply(fontSizeFactor: 1.5),
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
                                  width: 2,
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
                                  width: 2,
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
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 5.0, left: 20.0, right: 20.0),
                      //EMAIL TEXTFIELD
                      child: TextFormField(
                        controller: _emailField,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2,
                                  color: Color.fromRGBO(102, 155, 139, 1))),
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
                                  width: 2,
                                  color: Color.fromRGBO(102, 155, 139, 1))),
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
                      padding: const EdgeInsets.only(top: 4.0),
                      child: RichText(
                          text: TextSpan(
                              style: const TextStyle(
                                  color: Color.fromRGBO(102, 155, 139, 1),
                                  decoration: TextDecoration.underline,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold),
                              text: "Register",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () async {
                                  bool shouldNavigate = await register(
                                      _emailField.text, _passwordField.text);
                                  if (shouldNavigate) {
                                    FirebaseFirestore.instance
                                        .collection('users')
                                        .add({
                                      'first': _firstname.text,
                                      'last': _lastname.text,
                                      'email': _emailField.text,
                                    });
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const Profiles(),
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
                                  fontWeight: FontWeight.bold),
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
