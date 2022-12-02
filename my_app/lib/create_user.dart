import 'package:flutter/material.dart';
import 'package:my_app/user_profile.dart';
import 'package:http/http.dart' as http;

void postUser(
  String name,
  String bio,
  String fav_topic,
) async {
  var url = Uri.https('example.com', 'whatsit/create');
  var request = {'usrID': ''};
  var response =
      await http.post(url, body: {'name': 'doodle', 'color': 'blue'});
}

class CreateUser extends StatefulWidget {
  const CreateUser({super.key});
  State<CreateUser> createState() => _CreateUserState();
}

class MyPainterShort extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Color.fromRGBO(102, 155, 139, 1).withOpacity(1);

    final center = Offset(size.width / 2, size.height / 4.5);
    canvas.drawCircle(center, size.width / 1.8, paint);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return true;
  }
}

class MyPainterTall extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Color.fromRGBO(102, 155, 139, 1).withOpacity(1);

    final center = Offset(size.width / 2, size.height / 4.5);
    canvas.drawCircle(center, size.width / 1.15, paint);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return true;
  }
}

class _CreateUserState extends State<CreateUser> {
  final TextEditingController _nameField = TextEditingController();
  final TextEditingController _bioField = TextEditingController();
  final TextEditingController _topicField = TextEditingController();

  var name;
  var bio;
  var topic;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(241, 241, 248, 1),
      body: SafeArea(
        top: false,
        child: Center(
          child: Column(
            children: [
              Stack(
                children: <Widget>[
                  Container(
                    color: const Color.fromRGBO(241, 241, 248, 1),
                    width: 400,
                    height: 250,
                    child: CustomPaint(
                      painter: MyPainterShort(),
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
                              image: AssetImage('images/usericon.png'),
                              fit: BoxFit.fill),
                        ),
                      ),
                    ),
                  )
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(
                    top: 0, right: 282), //set top back to 40.0
                child: RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context)
                        .style
                        .apply(fontSizeFactor: 1.5),
                    children: const <TextSpan>[
                      TextSpan(
                        text: 'Name',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(102, 155, 139, 1),
                            decoration: TextDecoration.none),
                      ),
                    ],
                  ),
                ),
              ),
              // Name TextField

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextFormField(
                      controller: _nameField,
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
              ),

              Padding(
                padding: const EdgeInsets.only(top: 40.0, right: 315),
                child: RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context)
                        .style
                        .apply(fontSizeFactor: 1.5),
                    children: const <TextSpan>[
                      TextSpan(
                        text: 'Bio',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(102, 155, 139, 1),
                            decoration: TextDecoration.none),
                      ),
                    ],
                  ),
                ),
              ),

              // Bio TextField
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: SizedBox(
                    height: 150,

                    child: TextFormField(
                        controller: _bioField,
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

                    // child: TextField (
                    //     keyboardType: TextInputType.multiline,
                    //     maxLines: null,
                    //     decoration: InputDecoration(
                    //     contentPadding: EdgeInsets.symmetric(vertical: 40.0),
                    //     border: InputBorder.none,
                    //     hintText: 'Bio',
                    //     ),
                    // ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 40.0, right: 175),
                child: RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context)
                        .style
                        .apply(fontSizeFactor: 1.5),
                    children: const <TextSpan>[
                      TextSpan(
                        text: 'Favorite Topic',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(102, 155, 139, 1),
                            decoration: TextDecoration.none),
                      ),
                    ],
                  ),
                ),
              ),
              // Fav Topic TextField
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextFormField(
                      controller: _topicField,
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
              ),

              Padding(
                padding: const EdgeInsets.only(top: 35.0, bottom: 10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 2.75,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: const Color.fromRGBO(102, 155, 139, 1),
                  ),
                  child: MaterialButton(
                    onPressed: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileScreen(),
                          ))
                    },
                    child: const Text(
                      "Submit",
                      style: TextStyle(
                        color: Color.fromRGBO(244, 244, 249, 1),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
