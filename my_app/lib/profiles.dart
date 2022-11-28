import 'package:flutter/material.dart';
import './create_user.dart';

class Profiles extends StatefulWidget {
  const Profiles({super.key});

  @override
  State<Profiles> createState() => _ProfileState();
}

class _ProfileState extends State<Profiles> {
  @override
  Widget build(BuildContext context) {
    final List<String> words = ["John", "Jake", "Amy", "Carlos"];
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
            children: words
                .map((data) => ListTile(
                      title: Align(
                          alignment: Alignment.center,
                          child: Text(data,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Color(0xff11b719)))),
                      onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text("$data",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Color(0xff11b719))),
                              duration: const Duration(seconds: 2))),
                    ))
                .toList(),
          )),
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
                builder: (context) => const CreateUser(),
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
    ]));
  }
}
