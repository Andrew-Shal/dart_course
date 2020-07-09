import 'package:flutter/material.dart';
import '../models/image_model.dart';

class ImageItem extends StatelessWidget {
  const ImageItem({Key key, this.image}) : super(key: key);

  final ImageModel image;

  @override
  Widget build(context) {
    return Container(
      child: Column(
        children: <Widget>[
          Image(
            image: NetworkImage(image.url),
          ),
          Text('${image.title}'),
        ],
      ),
      padding: EdgeInsets.all(15.00),
      margin: EdgeInsets.fromLTRB(20.00, 5.00, 20.00, 5.00),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 2.00,
          style: BorderStyle.solid,
        ),
      ),
    );
  }
}
