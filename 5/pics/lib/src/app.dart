// Import flutter helper library
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'models/image_model.dart';
import 'dart:convert';
import './widgets/image_list.dart';

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
  int _counter = 1;
  List<ImageModel> _images = List<ImageModel>();

  // we could have used chaining .then() on get func
  void fetchImage() async {
    var url = 'https://jsonplaceholder.typicode.com/photos/$_counter';
    var response = await get(url);

    if (response.statusCode == 200) {
      print(response.body);
      var imageModel = new ImageModel.fromJson(json.decode(response.body));
      print(_images);
      // update state
      setState(() {
        // add image to list
        _images.add(imageModel);
        // increment counter
        _counter += 1;
      });
    }
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Flutter App'),
        ),
        body: Center(
          child: _images.length != 0
              ? ImageList(images: _images)
              : Text('start by adding new image'),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: fetchImage, // ref to func
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
