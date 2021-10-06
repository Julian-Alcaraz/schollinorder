import 'package:flutter/material.dart';
import 'package:schollinorder/UI/src/models/bloque.dart';
import 'package:schollinorder/UI/src/models/horaCatedra.dart';

class ModificarHorarioCurso extends StatefulWidget {
  @override
  _ModificarHorarioCursoState createState() => _ModificarHorarioCursoState();
}

class _ModificarHorarioCursoState extends State<ModificarHorarioCurso> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
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
  String valorCurso;
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
          Container(
            decoration: BoxDecoration(color: Color(0xFF364562)),
            width: 500,
            child: tablaCargar(listaDependiendoTurno),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("${bloque.horaDeCatedra.horas}"),
        Container(
          height: 40,
          width: 150,
          margin: EdgeInsets.only(bottom: 8, left: 5, top: 8),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: "",
              hintStyle: TextStyle(
                  color: Colors.black, fontSize: 15, letterSpacing: 0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.white, width: 1),
              ),
              fillColor: Colors.white,
              filled: true,
            ),
            onSaved: (value) {
              //lastnameValue = value;
            },
            validator: (value) {
              String ejemplo = "";
              if (value.isEmpty) {
                ejemplo = "llene este campo";
              }
              return ejemplo;
            },
          ),
        ),
      ],
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
