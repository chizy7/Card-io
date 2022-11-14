import 'package:flutter/material.dart';


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
        body: Column(
        children: [
            Container(
            height: 500,
            width: 500,
            child: ListView(
        children: words.map((data) =>ListTile(
          title: Align(
            alignment: Alignment.center,
            child: Text(data,
                      style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Color(0xff11b719)))
          ),
          onTap: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("$data",
                          style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Color(0xff11b719))),
            duration: Duration(seconds: 2)
          )),
        )).toList(),

        )),
        Container(
            height: 100,
            width: 500,
            child: TextButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () { },
                child: Text('Add Your Own Profile',
                        style: TextStyle(
                            fontSize: 20,
                        ),
                    ),
                ),
        ),
      ]));
    }
  }
