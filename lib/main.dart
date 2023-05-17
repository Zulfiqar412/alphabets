import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  runApp(MaterialApp( // classs
    home: AlphabetList(),//parameter
    debugShowCheckedModeBanner: false,
  ));
}

class AlphabetList extends StatefulWidget {
  @override
  _AlphabetListState createState() => _AlphabetListState();
}

class _AlphabetListState extends State<AlphabetList> {
  final List<String> _names = [
    'Apple',
    'Ball',
    'Cat',
    'Duck',
    'Elephant',
    'Flag',
    'Girl',
    'House',
    'Ice cream',
    'Jeep',
    'Kingaroo',
    'Lemon',
    'Mango',
    'Nose',
    'Orange',
    'Parrot',
    'Queen',
    'Rose',
    'Sun',
    'Tiger',
    'Umbrella',
    'Vehicle',
    'Watermelon',
    'X',
    'Yacht',
    'Zibra'
  ];

  final List<String> _alphabets = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z'
  ];

  FlutterTts? flutterTts; // varriable decleard

  @override
  void initState() { // before build this will call first
    super.initState();
    flutterTts = FlutterTts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyanAccent,
      appBar: AppBar(
        title: Text('Alphabet Learning App For Kids',style: TextStyle(color: Colors.black),),centerTitle: true,
        backgroundColor: Colors.cyanAccent,
      ),
      body: GridView.count(
        crossAxisCount: 4,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        children: List.generate(_alphabets.length, (index) {
          return InkWell(
            onTap: () {
              // Speak the alphabet when clicked
              flutterTts?.speak(_names[index]);
              // Navigate to the detail screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AlphabetDetail(
                    names: _names[index],
                    index: index,
                    color: Color.fromARGB(255, Random().nextInt(256),
                        Random().nextInt(256), Random().nextInt(256)),
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 7,
                        offset: Offset(0, 7), // changes position of shadow
                      ),
                    ],
                    border: Border.all(color: Colors.white,width: 2),
                    borderRadius: BorderRadius.only(

                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10))),
                child: Text(
                  _alphabets[index],
                  style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class AlphabetDetail extends StatelessWidget {
  final String names;
  final int index;
  final Color color;

  AlphabetDetail(
      {required this.index, required this.color, required this.names}); // constructor

  List<String> images = [
    "🍎",
    "⚽",
    "🐈",
    "🦆",
    "🐘",
    "🏴",
    "👩",
    "🏘",
    "🍨",
    "🚙",
    "🦘",
    "🍋",
    "🥭",
    "👃",
    "🍊",
    "🦜",
    "🧚‍",
    "🌹",
    "🌤",
    "🐅",
    "☔",
    "🚌",
    "🍉",
    "❌",
    "⛵",
    "🦓"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: color,
        appBar: AppBar(
          title: Text(names),
          centerTitle: true,
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  names,
                  style: TextStyle(fontSize: 80,color: Colors.white),
                ),
                Text(
                  images[index],
                  style: TextStyle(fontSize: 200.0, color: Colors.white),
                ),
              ],
            ),
            ),
        );
    }
}