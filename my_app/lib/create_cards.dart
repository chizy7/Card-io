import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CreateCards extends StatefulWidget {
  const CreateCards({super.key});

  @override
  State<CreateCards> createState() => _CreateCardsState();
}

Future<http.Response> postCard(topic, word, definition) {
  return http.post(
    Uri.parse(
        'https://us-central1-group-project-2-16d40.cloudfunctions.net/postCardData/card_insert'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'id': '1',
      'topic': '$topic',
      'word': '$word',
      'definition': '$definition',
      'usrID': '2',
    }),
  );
}

class _CreateCardsState extends State<CreateCards> {
  final TextEditingController _topicField = TextEditingController();
  final TextEditingController _wordField = TextEditingController();
  final TextEditingController _definitionField = TextEditingController();
  var topic;
  var word;
  var definition;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
                child: Column(children: [
      Container(
        width: 600,
        height: MediaQuery.of(context).size.height * .25,
        decoration: const BoxDecoration(
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
                  text: 'Topic',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(102, 155, 139, 1),
                      decoration: TextDecoration.none)),
            ],
          ),
        ),
      ),
      // Topic TextField
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: TextFormField(
          controller: _topicField,
          decoration: const InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1, color: Color.fromRGBO(102, 155, 139, 1))),
            filled: true,
            fillColor: Colors.white,
            hintText: "Enter the topic",
            hintStyle: TextStyle(
              color: Colors.black,
            ),
            labelText: "",
            labelStyle: TextStyle(
              color: Color.fromRGBO(102, 155, 139, 1),
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
                  text: 'Word',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(102, 155, 139, 1),
                      decoration: TextDecoration.none)),
            ],
          ),
        ),
      ),

      // Word TextField
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextFormField(
            controller: _wordField,
            decoration: const InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1, color: Color.fromRGBO(102, 155, 139, 1))),
              filled: true,
              fillColor: Colors.white,
              hintText: "Enter the word",
              hintStyle: TextStyle(
                color: Colors.black,
              ),
              labelText: "",
              labelStyle: TextStyle(
                color: Color.fromRGBO(102, 155, 139, 1),
              ),
            ),
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
                  text: 'Definition',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(102, 155, 139, 1),
                      decoration: TextDecoration.none)),
            ],
          ),
        ),
      ),

      // Definition TextField
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: TextFormField(
          controller: _definitionField,
          decoration: const InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1, color: Color.fromRGBO(102, 155, 139, 1))),
            filled: true,
            fillColor: Colors.white,
            hintText: "Enter the definition",
            hintStyle: TextStyle(
              color: Colors.black,
            ),
            labelText: "",
            labelStyle: TextStyle(
              color: Color.fromRGBO(102, 155, 139, 1),
            ),
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

// Button
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
              onPressed: () async {
                setState(() {
                  topic = _topicField.text;
                  word = _wordField.text;
                  definition = _definitionField.text;
                });
                postCard(topic, word, definition);
              },
              child: const Text("Submit",
                  style: TextStyle(color: Color.fromRGBO(244, 244, 249, 1)))),
        ),
      )
    ]))));
  }
}
