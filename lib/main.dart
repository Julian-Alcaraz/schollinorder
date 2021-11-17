import 'package:flutter/material.dart';
import 'package:schollinorder/UI/src/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Scholl in order',
      routes: MyRoutes.routes,
      initialRoute: "/Splash", //cambiar por el splash
    );
  }
}
