import 'package:flutter/material.dart';

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
                  child: const Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Name',
                      ),
                    ),
                  ),
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
                  child: const SizedBox(
                    height: 150,

                    child: Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Give a brief description of yourself',
                        ),
                      ),
                    ),

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
                  child: const Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Fav Topic',
                      ),
                    ),
                  ),
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
                    onPressed: () => {},
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
