import 'package:flutter/material.dart';
import 'package:schollinorder/src/pages/home/home.dart';
import 'package:schollinorder/src/pages/alumno/alumno.dart';
import 'package:schollinorder/src/pages/login/crearcuenta.dart';
import 'package:schollinorder/src/pages/login/login.dart';
import 'package:schollinorder/src/pages/profesor/profesor.dart';
import 'package:schollinorder/src/pages/administrativos/administrativos.dart';
import 'package:schollinorder/src/pages/splash/splash.dart';

class MyRoutes {
  static Map<String, Widget Function(BuildContext)> get routes => {
        "/Splash": (_) => SplashPage(),
        "/Home": (_) => HomePage(),
        "/Alumnos": (_) => AlumnoPage(),
        "/Profesor": (_) => ProfesorPage(),
        "/Administrativos": (_) => AdministrativosPages(),
        "/Login": (_) => LoginPage(),
      };
}
