// need to import helper library
// from flutter to get contetn on the screen
import 'package:flutter/material.dart';

// Define a 'main' function to run when our app starts
void main() {
  // Create a new text widget to show some text on the screen
  var app = MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('My Flutter App'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // add on pressed code here
          print('floating button pressed!');
        },
        label: Text('Add Image'),
        icon: Icon(
          Icons.add_a_photo,
        ),
        backgroundColor: Colors.lime,
      ),
    ),
  );
  // Take that widget and get it on the screen

  runApp(app);
}
