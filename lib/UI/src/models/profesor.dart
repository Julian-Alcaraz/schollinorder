class Profesor {
  final String apellido;
  final String nombre;
  final String numero;
  final String dni;

  Profesor({this.apellido, this.nombre, this.numero, this.dni});
}

final profesor = Profesor(
    apellido: "Wiederman", nombre: "Exequiel", numero: "150", dni: "40501");
final profesor1 = Profesor(
    apellido: "Wiederman", nombre: "Exequiel", numero: "55", dni: "266156");
final profesor2 = Profesor(
    apellido: "Bottaso", nombre: "Laura", numero: "54548", dni: "1661");
final profesor3 = Profesor(
    apellido: "Calderon", nombre: "Erik", numero: "1254", dni: "2105616");
final profesor4 =
    Profesor(apellido: "Gabis", nombre: "Matias", numero: "245", dni: "15151");
final profesor5 = Profesor(
    apellido: "Wiederman", nombre: "Exequiel", numero: "1234", dni: "0251");
//PROFESOR TALLER
final profesor6 = Profesor(
    apellido: "Baier", nombre: "Alejandro", numero: "06151", dni: "21516");
final List<Profesor> listaProfesores = [
  Profesor(
      apellido: "Wiederman", nombre: "Exequiel", numero: "1234", dni: "0251"),
  Profesor(apellido: "Bottaso", nombre: "Laura", numero: "54548", dni: "1661"),
  Profesor(
      apellido: "Calderon", nombre: "Erik", numero: "1254", dni: "2105616"),
  Profesor(apellido: "Gabis", nombre: "Matias", numero: "245", dni: "15151"),
  Profesor(
      apellido: "Colillan", nombre: "Sebastian", numero: "2525", dni: "0216"),
  Profesor(
      apellido: "Baier", nombre: "Alejandro", numero: "06151", dni: "21516"),
  Profesor(apellido: "Ortega", nombre: "Paola"),
];
