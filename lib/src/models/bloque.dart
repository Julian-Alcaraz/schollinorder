import 'package:schollinorder/src/models/horaCatedra.dart';
import 'package:schollinorder/src/models/profesor.dart';

class Bloque {
  final HoraCatedra horaDeCatedra;
  final Profesor profesor;
  final String asistencia;
  final String materia;

  Bloque({
    this.horaDeCatedra,
    this.profesor,
    this.asistencia,
    this.materia,
  });
}

final List<Bloque> teoriaTarde = [
  Bloque(
    horaDeCatedra: primerHoraT,
    profesor: profesor1,
    asistencia: "P",
    materia: "materia",
  ),
  Bloque(
    horaDeCatedra: segundaHoraT,
    profesor: profesor1,
    asistencia: "P",
    materia: "materia",
  ),
  Bloque(
    horaDeCatedra: tercerHoraT,
    profesor: profesor4,
    asistencia: "P",
    materia: "materia",
  ),
  Bloque(
    horaDeCatedra: cuartaHoraT,
    profesor: profesor2,
    asistencia: "P",
    materia: "materia",
  ),
  Bloque(
    horaDeCatedra: quintaHoraT,
    profesor: profesor2,
    asistencia: "P",
    materia: "materia",
  ),
  Bloque(
    horaDeCatedra: sextaHoraT,
    profesor: profesor3,
    asistencia: "P",
    materia: "materia",
  ),
  Bloque(
    horaDeCatedra: septimaHoraT,
    profesor: profesor3,
    asistencia: "P",
    materia: "materia",
  ),
];
final bloque = Bloque(
  horaDeCatedra: primerHoraT,
  profesor: profesor,
  asistencia: "P",
  materia: "materia",
);
