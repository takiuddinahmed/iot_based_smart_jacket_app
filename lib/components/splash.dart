// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Text(
                "Smart Jacket\n BUFT",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 60,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 200,
                width: 200,
                child: const LoadingIndicator(
                  indicatorType: Indicator.ballSpinFadeLoader,
                  

                  /// Optional, the stroke backgroundColor
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
