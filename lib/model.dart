import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());

class Data {
    Data({
        this.ecg = 0,
        this.heartBit = 0,
        this.oxygen = 0,
        this.lat = 0,
        this.long = 0,
    });

    int ecg;
    int heartBit;
    int oxygen;
    double lat;
    double long;

    factory Data.fromJson(Map<dynamic, dynamic> json) => Data(
        ecg: json["ecg"],
        heartBit: json["heart_bit"],
        oxygen: json["oxygen"],
        lat: json["lat"].toDouble(),
        long: json["long"].toDouble(),
    );

    factory Data.fromSnapshot(DataSnapshot snapshot){
      return Data.fromJson(snapshot.value as Map<dynamic, dynamic>);
    }

    Map<String, dynamic> toJson() => {
        "ecg": ecg,
        "heart_bit": heartBit,
        "oxygen": oxygen,
        "lat": lat,
        "long": long,
    };
}