import 'package:flutter/material.dart';
import 'package:schollinorder/UI/src/models/bloque.dart';

class CargarHorarioCurso extends StatefulWidget {
  @override
  _CargarHorarioCursoState createState() => _CargarHorarioCursoState();
}

class _CargarHorarioCursoState extends State<CargarHorarioCurso> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  List<String> listaDias = [
    "Lunes",
    "Martes",
    "Miercoles",
    "Jueves",
    "Viernes"
  ];
  List<String> listaCursos = [
    "6to 1era",
    "6to 2da",
    "5to 1era",
    "5to 2da",
  ];
  String valorCurso = "";
  String valorDia = "";
  List<String> listaTurnos = ["Teoria", "Taller"];
  String valorTurno = "";
  List<Bloque> listaDependiendoTurno = [];

  @override
  void initState() {
    valorCurso = listaCursos.first;
    valorTurno = listaTurnos.first;
    valorDia = listaDias.first;
    listaDependiendoTurno = teoriaTarde;

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: drawer(),
      appBar: appBar(),
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Dia",
                      style: TextStyle(fontSize: 18),
                    ),
                    _botonDesplegableDia()
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Curso",
                      style: TextStyle(fontSize: 18),
                    ),
                    _botonDesplegableCurso()
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Turno",
                      style: TextStyle(fontSize: 18),
                    ),
                    _botonDesplegableTurno()
                  ],
                ),
              )
            ],
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.indigo.shade100,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    border: Border.all(color: Colors.indigo.shade200, width: 3),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Complete el formulario para poder cargar el horario",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.indigo.shade100,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      border:
                          Border.all(color: Colors.indigo.shade200, width: 3),
                    ),
                    width: 300,
                    child: tablaCargar(listaDependiendoTurno),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF364562),
                      ),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          print("Carga Horario completo bien");
                        } else {
                          print("no carga el horario");
                        }
                      },
                      child: Text("Cargar horario"),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF364562),
                      ),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          print("Modifica temporalmente");
                        } else {
                          print("no modifica temporalmente");
                        }
                      },
                      child: Text("Modificar horario Temporalmente"),
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF364562),
                  ),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      print("Modifica permanentemente");
                    } else {
                      print("No modificapermanentemente");
                    }
                  },
                  child: Text("Modificar horario permanentemente"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget tablaCargar(List<Bloque> lista) {
    return Container(
      height: 370,
      child: ListView.builder(
          itemCount: lista.length,
          itemBuilder: (context, index) => _botonHora(lista[index])),
    );
  }

  Widget _botonHora(Bloque bloque) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "${bloque.horaDeCatedra.horas}",
          hintStyle: TextStyle(
            color: Colors.black,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Colors.black, width: 2),
          ),
          fillColor: Colors.white,
          filled: true,
        ),
        validator: (value) => value.isEmpty ? "Complete este campo" : null,
      ),
    );
  }

  Widget _botonDesplegableCurso() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(
          color: Colors.indigo.shade200,
          width: 2,
        ),
        color: Colors.indigo.shade100,
      ),
      child: DropdownButton<String>(
        //PERSONALIZACION
        dropdownColor: Colors.indigo.shade100,
        hint: Text(
          "",
          style: TextStyle(color: Colors.black),
        ),
        //FUNCIONALIDAD
        items: listaCursos.map((String showedOption) {
          return DropdownMenuItem(
            value: showedOption,
            child: Text(showedOption),
          );
        }).toList(),
        onChanged: (selectedOption) {
          setState(() {
            valorCurso = selectedOption;
          });
          _cambioDeturno(valorCurso);
        },
        value: valorCurso,
      ),
    );
  }

  Widget _botonDesplegableTurno() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(
          color: Colors.indigo.shade200,
          width: 2,
        ),
        color: Colors.indigo.shade100,
      ),
      child: DropdownButton<String>(
        //PERSONALIZACION
        dropdownColor: Colors.indigo.shade100,
        hint: Text(
          "",
          style: TextStyle(color: Colors.black),
        ),
        //FUNCIONALIDAD
        items: listaTurnos.map((String showedOption) {
          return DropdownMenuItem(
            value: showedOption,
            child: Text(showedOption),
          );
        }).toList(),
        onChanged: (selectedOption) {
          setState(() {
            valorTurno = selectedOption;
          });
          _cambioDeturno(valorTurno);
        },
        value: valorTurno,
      ),
    );
  }

  void _cambioDeturno(valor) {
    listaDependiendoTurno = [];
    if (valor == "Taller") {
      listaDependiendoTurno = tallerManana;
    } else {
      listaDependiendoTurno = teoriaTarde;
    }
    setState(() {});
  }

  Widget _botonDesplegableDia() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(
          color: Colors.indigo.shade200,
          width: 2,
        ),
        color: Colors.indigo.shade100,
      ),
      child: DropdownButton(
        //PERSONALIZACION
        dropdownColor: Colors.indigo.shade100,
        hint: Text(
          "",
          style: TextStyle(color: Colors.black),
        ),
        //FUNCIONALIDAD
        items: listaDias.map((String showedOption) {
          return DropdownMenuItem(
            value: showedOption,
            child: Text(showedOption),
          );
        }).toList(),
        onChanged: (selectedOption) {
          setState(() {
            valorDia = selectedOption;
          });
        },
        value: valorDia,
      ),
    );
  }

  Widget appBar() {
    return AppBar(
      leading: Image.asset(
        "assets/logo.jpg",
      ),
      backgroundColor: Color(0xFF364562), // color del appbar fondo
      actions: [
        IconButton(
          icon: Icon(Icons.account_circle_rounded, size: 35),
          onPressed: () {
            _scaffoldKey.currentState.openEndDrawer();
          },
        ),
      ],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
    );
  }

  Widget drawer() {
    return Drawer(
      child: Material(
        color: Colors.indigo.shade100,
        child: Column(
          children: [
            DrawerHeader(
              child: Center(
                child: Column(
                  children: [
                    CircleAvatar(maxRadius: 60),
                    Text("Nombre Alumno"),
                  ],
                ),
              ),
            ),
            ListTile(
              focusColor: Colors.amber,
              title: Text("Notificaciones"),
              tileColor: Colors.indigo.shade300,
              onTap: () {},
            ),
            Spacer(),
            ListTile(
              focusColor: Colors.amber,
              title: Text("Cerrar Sesion"),
              tileColor: Color(0xFF364562),
              onTap: () {
                Navigator.of(context).pushReplacementNamed("/Login");
              },
            ),
          ],
        ),
      ),
    );
  }
}
