import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
    const HomePage({super.key});

    @override
    State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 34),
                    child: Column(
                        children: [
                            Row(
                                mainAxisAlignment: mainAxisAlignment.spaceBetween,
                                children: [
                                    Icon(
                                        Icons.add_circle_outline
                                    )
                                ]
                            )
                        ]
                    )
                )
            )
        )
    }
}