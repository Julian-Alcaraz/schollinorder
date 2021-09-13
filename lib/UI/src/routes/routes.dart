import 'package:flutter/material.dart';
import 'package:schollinorder/UI/src/pages/administrativos/cargarDatosProfesor.dart';
import 'package:schollinorder/UI/src/pages/administrativos/cargarFaltasProfesor.dart';
import 'package:schollinorder/UI/src/pages/administrativos/modificarHorarioCurso.dart';
import 'package:schollinorder/UI/src/pages/administrativos/verDatosProfesor.dart';
import 'package:schollinorder/UI/src/pages/home/home.dart';
import 'package:schollinorder/UI/src/pages/alumno/alumno.dart';
import 'package:schollinorder/UI/src/pages/login/crearcuenta.dart';
import 'package:schollinorder/UI/src/pages/login/login.dart';
import 'package:schollinorder/UI/src/pages/profesor/profesor.dart';
import 'package:schollinorder/UI/src/pages/administrativos/administrativos.dart';
import 'package:schollinorder/UI/src/pages/splash/splash.dart';

class MyRoutes {
  static Map<String, Widget Function(BuildContext)> get routes => {
        "/Splash": (_) => SplashPage(),
        "/Home": (_) => HomePage(),
        "/Alumnos": (_) => AlumnoPage(),
        "/Profesor": (_) => ProfesorPage(),
        "/Administrativos": (_) => AdministrativosPages(),
        "/Login": (_) => LoginPage(),
        "/CrearCuenta": (_) => CrearCuenta(),
        "/CargarDatos": (_) => CargarDatosProfesor(),
        "/VerDatos": (_) => VerDatosProfesor(),
        "/CargarFaltas": (_) => CargarFaltasProfesor(),
        "/ModificarHorario": (_) => ModificarHorarioCurso(),
      };
}
