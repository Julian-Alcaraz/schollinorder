class Profesor {
  final String apellido;
  final String nombre;

  Profesor({this.apellido, this.nombre});
}

final profesor = Profesor(apellido: "Wiederman", nombre: "Exequiel");
final profesor1 = Profesor(apellido: "Wiederman", nombre: "Exequiel");
final profesor2 = Profesor(apellido: "Bottaso", nombre: "Laura");
final profesor3 = Profesor(apellido: "Calderon", nombre: "Erik");
final profesor4 = Profesor(apellido: "Gabis", nombre: "Matias");
final profesor5 = Profesor(apellido: "Wiederman", nombre: "Exequiel");
//PROFESOR TALLER
final profesor6 = Profesor(apellido: "Baier", nombre: "Alejandro");
final List<Profesor> listaProfesores = [
  Profesor(apellido: "Wiederman", nombre: "Exequiel"),
  Profesor(apellido: "Bottaso", nombre: "Laura"),
  Profesor(apellido: "Calderon", nombre: "Erik"),
  Profesor(apellido: "Gabis", nombre: "Matias"),
  Profesor(apellido: "Colillan", nombre: "Sebastian"),
  Profesor(apellido: "Baier", nombre: "Alejandro"),
  Profesor(apellido: "Ortega", nombre: "Paola"),
];
