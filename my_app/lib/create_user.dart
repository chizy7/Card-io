import 'package:flutter/material.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({super.key});

  @override
  State<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  final TextEditingController _nameField = TextEditingController();
  final TextEditingController _bioField = TextEditingController();
  final TextEditingController _topicField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
                child: Column(children: [
      Container(
        width: 600,
        height: MediaQuery.of(context).size.height * .25,
        

        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color.fromRGBO(102, 155, 139, 1),
          // borderRadius: BorderRadius.only({Radius.zero, Radius.zero, 15.0, bottomRight = 15.0}),
        ),
        
      ),


    
      Padding(
        padding: const EdgeInsets.only(top: 50.0, right: 282),
        child: RichText(
          text: TextSpan(
            style:
                DefaultTextStyle.of(context).style.apply(fontSizeFactor: 1.5),
            children: const <TextSpan>[
              TextSpan(
                  text: 'Name',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(102, 155, 139, 1),
                      decoration: TextDecoration.none)),
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
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
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
        padding: const EdgeInsets.only(top: 50.0, right: 315),
        child: RichText(
          text: TextSpan(
            style:
                DefaultTextStyle.of(context).style.apply(fontSizeFactor: 1.5),
            children: const <TextSpan>[
              TextSpan(
                  text: 'Bio',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(102, 155, 139, 1),
                      decoration: TextDecoration.none)),
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
            
            child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
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
        padding: const EdgeInsets.only(top: 50.0, right: 175),
        child: RichText(
          text: TextSpan(
            style:
                DefaultTextStyle.of(context).style.apply(fontSizeFactor: 1.5),
            children: const <TextSpan>[
              TextSpan(
                  text: 'Favorite Topic',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(102, 155, 139, 1),
                      decoration: TextDecoration.none)),
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
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
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
              onPressed: () async {},
              child: const Text("Submit",
                  style: TextStyle(color: Color.fromRGBO(244, 244, 249, 1)))),
        ),
      )
    ]))));
  }
}
