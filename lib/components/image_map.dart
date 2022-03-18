import 'package:flutter/material.dart';

class ImageMap extends StatelessWidget {
  int lat = 2436778;
  int long = 8862275;
  ImageMap({Key? key, this.lat = 24367, this.long = 88622})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: 400,
      child:
          Image.network("https://tile.openstreetmap.org/11/${lat}/${long}.png"),
    );
  }}