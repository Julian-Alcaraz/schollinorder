import 'dart:async';

import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    goToHome();
  }

  goToHome() async {
    final _duration = Duration(seconds: 4);
    //trear/cargar lo necesario
    Timer(_duration, () async {
      Navigator.of(context).pushReplacementNamed("/Home");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Image.asset(
            "assets/nombredelaimagen.jpg", // descargar imagen y ponerla en assets, y cambiar aca
            height: 250,
          ),
        ));
  }
}
