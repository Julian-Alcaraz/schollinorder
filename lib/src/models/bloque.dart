import 'package:schollinorder/src/models/curso.dart';
import 'package:schollinorder/src/models/horaCatedra.dart';
import 'package:schollinorder/src/models/profesor.dart';
class Bloque {
  final HoraCatedra horaDeCatedra;
  final Profesor profesor;
  final String asistencia;
  final String materia;
  final Curso curso;

  Bloque({
    this.horaDeCatedra,
    this.profesor,
    this.asistencia,
    this.materia,
    this.curso,
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



final List<Bloque> teoriaTardeProfesor = [
  Bloque(
    horaDeCatedra: primerHoraT,
    materia: "Redes",
    curso: sextoPrimera,
  ),
  Bloque(
    horaDeCatedra: segundaHoraT,
   curso: sextoPrimera,
    materia: "Redes",
  ),
  Bloque(
    horaDeCatedra: tercerHoraT,
    curso: sextoPrimera,
    materia: "Redes",
  ),
  Bloque(
    horaDeCatedra: cuartaHoraT,
    curso: libre,
    materia: "Libre",
  ),
  Bloque(
    horaDeCatedra: quintaHoraT,
   curso: libre,
    materia: "Libre",
  ),
  Bloque(
    horaDeCatedra: sextaHoraT,
    curso: sextoSegunda,
    materia: "Redes",
  ),
  Bloque(
    horaDeCatedra: septimaHoraT,
    curso: sextoSegunda,
    materia: "Redes",
  ),
];