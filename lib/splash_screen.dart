import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
      Duration(seconds: 4),
      () {
        Navigator.pushNamed(context, '/login');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blue.shade800, Colors.white],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight)),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 100, 100, 0),
              child: Image.asset(
                'assets/img/esp32cam_logo.png',
              ),
            ),
            const SizedBox(
              height: 120,
            ),
            Image.asset(
              'assets/img/loading3.gif',
            )
          ],
        ),
      ),
    ));
  }
}
