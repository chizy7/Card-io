import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flip_card/flip_card.dart';
import 'package:my_app/flashcard_view.dart';
import 'flashcard_view.dart';
import 'flashcard.dart';

class ShowCards extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ShowCardsState();
}

List<Flashcard> _flashcards = [
  Flashcard(
      word: "Big O Notation",
      definition:
          "a mathematical notation that describes the limiting behavior of a function when the argument tends towards a particular value or infinity"),
  Flashcard(word: "SQL", definition: "Structured Query Language"),
];

int _currentIndex = 0;

class _ShowCardsState extends State<ShowCards> {
  @override
  Widget build(BuildContext context) {
    double WIDTH = MediaQuery.of(context).size.width;
    double HEIGHT = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: WIDTH * .8,
              height: HEIGHT * .6,
              child: FlipCard(
                  front: FlashcardView(
                    text: _flashcards[_currentIndex].word,
                  ),
                  back: FlashcardView(
                    text: _flashcards[_currentIndex].definition,
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OutlinedButton.icon(
                    onPressed: showPrev,
                    icon: Icon(Icons.chevron_left),
                    label: Text('Prev')),
                OutlinedButton.icon(
                    onPressed: showNext,
                    icon: Icon(Icons.chevron_right),
                    label: Text('Next')),
              ],
            )
          ],
        ),
      ),
    );
  }

  void showNext() {
    setState(() {
      _currentIndex =
          (_currentIndex + 1 < _flashcards.length) ? _currentIndex + 1 : 0;
    });
  }

  void showPrev() {
    setState(() {
      _currentIndex =
          (_currentIndex - 1 >= 0) ? _currentIndex - 1 : _flashcards.length - 1;
    });
  }
}
