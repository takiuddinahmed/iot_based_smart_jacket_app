import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:smart_jacket_buft_1/components/splash.dart';
import 'package:smart_jacket_buft_1/components/view.dart';
import 'package:smart_jacket_buft_1/model.dart';
import 'package:flutter_map/flutter_map.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  Data data = Data(lat: 24, long: 89);
  bool alerm = false;
  bool loaded = false;
  bool splashTime = true;

  DatabaseReference dataRef = FirebaseDatabase.instance.ref("data");
  DatabaseReference alermRef = FirebaseDatabase.instance.ref("alerm");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        splashTime = false;
      });
    });
    FirebaseAuth.instance.signInWithEmailAndPassword(email: "user@user.com", password: "12345678");
    dataRef.onValue.listen((event) {
      setState(() {
        data = Data.fromSnapshot(event.snapshot);
        loaded = true;
      });
      print(data.toJson());
    });

    alermRef.onValue.listen((event) {
      setState(() {
        alerm = event.snapshot.value as bool;
      });
      if (alerm) {
        Future.delayed(const Duration(seconds: 20), () {
          alermRef.set(false);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return (!splashTime && loaded)
        ? View(data: data, alerm: alerm)
        : const Splash();
  }
}
