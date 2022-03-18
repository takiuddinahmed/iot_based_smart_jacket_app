import 'package:flutter/material.dart';

class SingleTile extends StatelessWidget {
  String title = "";
  dynamic value = 0;
  bool short = false;
  SingleTile(
      {Key? key, required this.title, required this.value, this.short = false})
      : super(key: key) ;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 200,
      child: Card(
        elevation: 8,
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              value.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: !short ? 40 : 30),
            ),
          ],
        ),
      ),
    );
  }
}
