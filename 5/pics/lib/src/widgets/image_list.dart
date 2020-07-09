import 'package:flutter/material.dart';
import '../models/image_model.dart';
import '../widgets/image_item.dart';

class ImageList extends StatelessWidget {
  const ImageList({Key key, this.images}) : super(key: key);

  final List<ImageModel> images;

  @override
  Widget build(context) {
    return ListView(children: <Widget>[
      for (var img in images)
        ImageItem(
          key: Key(img.id.toString()),
          image: img,
        )
    ]);
  }
}
