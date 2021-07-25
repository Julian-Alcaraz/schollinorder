import 'package:flutter/material.dart';
import 'package:schollinorder/src/routes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scholl in order',
      routes: MyRoutes.routes,
      initialRoute: "/Home", //cambiar por el splash
    );
  }
}
