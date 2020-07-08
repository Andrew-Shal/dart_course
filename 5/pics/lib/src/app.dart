// Import flutter helper library
import 'package:flutter/material.dart';

// Create a class that will be our custom widget
// This class must extend the 'StatefulWidget' base class
// this has a _counter state
class App extends StatefulWidget {
  const App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

// the logic for the stateful widget
class _AppState extends State<App> {
  // instance var that will change over time
  int _counter = 0;

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Flutter App'),
        ),
        body: Center(
          child: Text('$_counter images'),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            // add on pressed code here
            setState(() {
              _counter += 1;
            });
          },
          label: Text('Add Image'),
          icon: Icon(
            Icons.add_a_photo,
          ),
          backgroundColor: Colors.lime,
        ),
      ),
    );
  }
}

// Must define a 'build' method that returns
// the widget that *this* widget will show
