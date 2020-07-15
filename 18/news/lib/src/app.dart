import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'blocs/stories_provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoriesProvider(
      child: MaterialApp(
        title: 'News Application',
        home: Home(),
      ),
    );
  }
}
