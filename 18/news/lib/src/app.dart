import 'package:flutter/material.dart';
import 'package:news/src/screens/news_list.dart';
import 'screens/home.dart';
import 'blocs/stories_provider.dart';
import 'screens/news_detail.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoriesProvider(
      child: MaterialApp(
        title: 'News Application',
        onGenerateRoute: routes,
      ),
    );
  }
}

Route routes(RouteSettings settings) {
  if (settings.name == '/') {
    return MaterialPageRoute(
      builder: (context) {
        return Home();
      },
    );
  } else {
    return MaterialPageRoute(builder: (context) {
      return NewsList();
    });
  }
}
