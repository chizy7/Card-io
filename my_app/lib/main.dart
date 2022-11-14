// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import './profiles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Profiles'),
        ),
        body: Profiles(),
      ),
    );
  }
}

// class Profiles extends StatefulWidget {
//     const Profiles({super.key});

//     @override
//     State<Profiles> createState() => _ProfileState();
//   }

//   class _ProfileState extends State<Profiles> {
//     @override
//     Widget build(BuildContext context) {
//       final List<String> words = ["John", "Jake", "Amy", "Carlos"];
//       return ListView(
//         children: words.map((data) =>ListTile(
//           title: Align(
//             alignment: Alignment.center,
//             child: Text(data,
//                       style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 30,
//                       color: Color(0xff11b719)))
//           ),
//           onTap: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//             content: Text("$data",
//                           style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 14,
//                           color: Color(0xff11b719))),
//             duration: Duration(seconds: 2)
//           )),
//         )).toList(),
//       );
//     }
//   }
