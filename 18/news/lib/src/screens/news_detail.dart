import 'package:flutter/material.dart';

class NewsDetail extends StatelessWidget {
  final int itemId;
  NewsDetail({this.itemId});

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: Text('On details screen with item id: ${itemId.toString()}'),
    );
  }
}
