import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import './register.dart';
import '/services/flutterfire.dart';
import './profiles.dart';
import 'google_auth.dart';
import 'create_user.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailField = TextEditingController();
  final TextEditingController _passwordField = TextEditingController();

  Future<User?> signInWithGoogle(BuildContext context) async {
    await Authentication().signInWithGoogle();
    if (_auth.currentUser != null) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Profiles(),
          ));
    }
    return _auth.currentUser;
  }

  void checkAuthentication(BuildContext context) {
    _auth.authStateChanges().listen((user) {
      if (_auth.currentUser != null) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Profiles(),
            ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // User user = Provider.of<User>(context);
    return Scaffold(
        backgroundColor: const Color.fromRGBO(241, 241, 248, 1),
        body: Column(
          children: <Widget>[
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
              height: MediaQuery.of(context).size.height * .45,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(244, 244, 249, 1),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 50, right: 270.0),
                      child: RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context)
                              .style
                              .apply(fontSizeFactor: .55),
                          children: const <TextSpan>[
                            TextSpan(
                                text: 'Sign In',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(237, 199, 192, 1),
                                    decoration: TextDecoration.none)),
                          ],
                        ),
                      ),
                    ),

                    // EMAIL TEXTFIELD
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 5.0, left: 20.0, right: 20.0),
                      child: TextFormField(
                        controller: _emailField,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1,
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

                    // PASSWORD TEXTFIELD
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 5.0, left: 20.0, right: 20.0),
                      child: TextFormField(
                        controller: _passwordField,
                        obscureText: true,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1,
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

                    //LOGIN BUTTON test@test.com !Test1
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0, bottom: 10.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2.75,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: const Color.fromRGBO(102, 155, 139, 1),
                        ),
                        child: MaterialButton(
                            onPressed: () async {
                              bool shouldNavigate = await signIn(
                                  _emailField.text, _passwordField.text);
                              if (shouldNavigate) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Profiles(),
                                  ),
                                );
                              }
                            },
                            child: const Text("Login",
                                style: TextStyle(
                                    color: Color.fromRGBO(244, 244, 249, 1)))),
                      ),
                    ),

                    Row(
                      children: const <Widget>[
                        Expanded(
                          child: Divider(
                              color: Color.fromRGBO(102, 155, 139, 1),
                              thickness: 2.0,
                              indent: 20.0,
                              endIndent: 5.0),
                        ),
                        Text(
                          'or',
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(102, 155, 139, 1)),
                        ),
                        Expanded(
                          child: Divider(
                              color: Color.fromRGBO(102, 155, 139, 1),
                              thickness: 2.0,
                              indent: 5.0,
                              endIndent: 20.0),
                        ),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: RichText(
                        text: TextSpan(
                            style: const TextStyle(
                                color: Color.fromRGBO(102, 155, 139, 1),
                                decoration: TextDecoration.underline,
                                fontSize: 15.0),
                            text: "Sign in with Google",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                signInWithGoogle(context);
                              }),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: RichText(
                        text: TextSpan(
                            style: const TextStyle(
                                color: Color.fromRGBO(102, 155, 139, 1),
                                decoration: TextDecoration.underline,
                                fontSize: 15.0),
                            text: "Don't have an account? Sign Up",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Register(),
                                  ),
                                );
                              }),
                      ),
                    ),
                  ]),
            ),
          ],
        ));
  }
  // return Profiles();
}
