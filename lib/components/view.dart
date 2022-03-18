import 'package:flutter/material.dart';
import 'package:smart_jacket_buft_1/components/image_map.dart';
import 'package:smart_jacket_buft_1/components/map.dart';
import 'package:smart_jacket_buft_1/components/single_tile.dart';
import 'package:smart_jacket_buft_1/model.dart';

class View extends StatelessWidget {
  Data data = Data(lat: 24, long: 89);
  bool alerm = false;
  View({Key? key, required this.data, required this.alerm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Smart Jacket"),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Center(
            child: ListView(children: [
              alerm
                  ? Card(
                      color: Colors.grey[100],
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          "PLEASE HELP",
                          style: TextStyle(
                              fontSize: 35,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ))
                  : Container(),
              Wrap(
                alignment: WrapAlignment.center,
                children: <Widget>[
                  SingleTile(title: "Heart Rate", value: data.heartBit),
                  SingleTile(title: "Oxygen", value: data.oxygen),
                  SingleTile(title: "ECG", value: data.ecg),
                  SingleTile(
                      title: "Location",
                      value: "${data.lat}, ${data.long}",
                      short: true),
                ],
              ),
              // ImageMap()
              MyMap(data: data)
            ]),
          ),
        ));
  }
}
