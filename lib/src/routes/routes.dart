import 'package:flutter/material.dart';
import 'package:schollinorder/src/pages/administrativos/cargarDatosProfesor.dart';
import 'package:schollinorder/src/pages/administrativos/cargarFaltasProfesor.dart';
import 'package:schollinorder/src/pages/administrativos/modificarHorarioCurso.dart';
import 'package:schollinorder/src/pages/administrativos/verDatosProfesor.dart';
import 'package:schollinorder/src/pages/home/home.dart';
import 'package:schollinorder/src/pages/alumno/alumno.dart';
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
        "/CargarDatos": (_) => CargarDatosProfesor(),
        "/VerDatos": (_) => VerDatosProfesor(),
        "/CargarFaltas": (_) => CargarFaltasProfesor(),
        "/ModificarHorario": (_) => ModificarHorarioCurso(),
      };
}
