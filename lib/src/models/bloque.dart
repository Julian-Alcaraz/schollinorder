import 'package:schollinorder/src/models/horaCatedra.dart';
import 'package:schollinorder/src/models/profesor.dart';

class Bloque {
  final HoraCatedra horasCatedra;
  final Profesor profesor;
  final String asistencia;
  final String materia;

  Bloque({
    this.horasCatedra,
    this.profesor,
    this.asistencia,
    this.materia,
  });
}

final bloque = Bloque(
  horasCatedra: primerHora,
  profesor: profesor,
  asistencia: "P",
  materia: "materia",
);
