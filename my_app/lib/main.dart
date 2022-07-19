// import 'dart:math'; // Old import for earlier build of the code

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final wordPair = WordPair.random(); // Used in StatefulWidget class instead
    return MaterialApp(
      // title: 'Welcome to Flutter', // Basic placeholder text for tutorial
      title: 'Startup Name Generator',
      home: Scaffold(
        appBar: AppBar(
          // title: const Text('Welcome to Flutter'), // Basic placeholder text for tutorial
          title: const Text('Startup Name Generator'),
        ),
        //body: const Center(
          //child: Text('Hello World'), // (static text value version)
          
          //body: Center(
              //child: Text(wordPair.asPascalCase) // (random text value version)

            body: const Center(
              child: RandomWords(), // Calls on and executes the RandomWords variable
            ),
        ),
      );
  }
}


class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    //final wordPair = WordPair.random();
    //return Text(wordPair.asPascalCase);
    // ^ Original version. Returned random word upon each hot reload of the application

    return ListView.builder (
    padding: const EdgeInsets.all(16.0),
    itemBuilder: (context, i) {
      if (i.isOdd) return const Divider();

    final index = i ~/ 2;
    if (index >= _suggestions.length) {
      _suggestions.addAll(generateWordPairs().take(10));
    }
      /* return Text(_suggestions[index].asPascalCase); 
          ^ This just returns a text widget for each row */

      return ListTile(
        title: Text(
          _suggestions[index].asPascalCase,
          style: _biggerFont,
          // This generates a tile: a fixed height row w/text. It's basically the
          // same result as returning the _suggestions list, but it looks more stylish.
        ),
      );
    },
  );

  }
}