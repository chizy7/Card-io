import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/auth/controller/auth_controller.dart';
import './register.dart';
import '/services/flutterfire.dart';
import './profiles.dart';

class SignInWithGoogleButton extends ConsumerWidget {
  const SignInWithGoogleButton({Key? key}) : super(key: key);

  void signInWithGoogle(BuildContext context, WidgetRef ref) {
    ref.read(authControllerProvider).signInWithGoogle();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox.shrink();
  }
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailField = TextEditingController();
  final TextEditingController _passwordField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 1,
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
          height: MediaQuery.of(context).size.height * .45,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(244, 244, 249, 1),
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
              Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 50.0, right: 270.0),
              child: RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context)
                      .style
                      .apply(fontSizeFactor: 1.5),
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
              padding: const EdgeInsets.only(top: 5.0, left: 20.0, right: 20.0),
              child: TextFormField(
                controller: _emailField,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 2, color: Color.fromRGBO(102, 155, 139, 1))),
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
              padding: const EdgeInsets.only(top: 5.0, left: 20.0, right: 20.0),
              child: TextFormField(
                controller: _passwordField,
                obscureText: true,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 2, color: Color.fromRGBO(102, 155, 139, 1))),
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
                      bool shouldNavigate =
                          await signIn(_emailField.text, _passwordField.text);
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignInWithGoogleButton(),
                          ),
                        );
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

            //REGISTER BUTTON
            // Padding(
            //     padding: EdgeInsets.only(top: 15.0),
            //     child: Container(
            //         width:MediaQuery.of(context).size.width / 1.4,
            //         height: 45,
            //         decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(15.0),
            //             color: Colors.white,
            //         ),
            //         child: MaterialButton(
            //             onPressed: () async {
            //                 bool shouldNavigate = await register(_emailField.text, _passwordField.text);
            //             if (shouldNavigate) {
            //             Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                     builder: (context) => Profiles(),
            //                 ),
            //                 );
            //             }
            //             },
            //             child: Text("Register"),
            //         ),
            //     ),
            // ),
          ]),
        ),
      ],
    ));
  }
}




          // child: Padding(
          //   padding: const EdgeInsets.only(bottom: 0),
          //   child: Column(
          //     children: [
          //       Image.asset(
          //         'images/leaflet.png',
          //         scale: .7,
          //       ), // <-- SEE HERE
          //     ],
          //   ),
          // ),

          