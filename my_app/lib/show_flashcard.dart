import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flip_card/flip_card.dart';
import 'package:my_app/flashcard_view.dart';
import 'flashcard_view.dart';
import 'flashcard.dart';

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
        backgroundColor: const Color.fromRGBO(102, 155, 139, 1),
        body: SafeArea(
            top: false,
            child: Center(
              child: Column(children: [
                Stack(
                  children: <Widget>[
                    Container(
                      color: const Color.fromRGBO(102, 155, 139, 1),
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
                Column(
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
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        OutlinedButton.icon(
                          onPressed: showPrev,
                          icon: Icon(Icons.chevron_left),
                          label: Text('Prev'),
                        ),
                        OutlinedButton.icon(
                          onPressed: showNext,
                          icon: Icon(Icons.chevron_right),
                          label: Text('Next'),
                        ),
                      ],
                    )
                  ],
                ),
              ]),
            )));
  }

  void showNext() {
    setState(() {
      _currentIndex =
          (_currentIndex + 1 < _flashcards.length) ? _currentIndex + 1 : 0;
    });
  }

  void showPrev() {
    setState(
      () {
        _currentIndex = (_currentIndex - 1 >= 0)
            ? _currentIndex - 1
            : _flashcards.length - 1;
      },
    );
  }
}
