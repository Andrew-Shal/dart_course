import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'blocs/stories_provider.dart';
import 'screens/news_detail.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoriesProvider(
      child: MaterialApp(
        title: 'News Application',
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(
            builder: (context) {
              return Home();
            },
          );
        },
      ),
    );
  }
}
