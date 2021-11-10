import 'package:flutter/material.dart';

class CrearCuenta extends StatefulWidget {
  @override
  _CrearCuentaState createState() => _CrearCuentaState();
}

class _CrearCuentaState extends State<CrearCuenta> {
  List<String> listaCursos = [
    "6to 1era",
    "6to 2da",
    "5to 1era",
    "5to 2da",
  ];
  String valorCurso = "";

  List<String> listaTipoCuenta = [
    "Alumno/a",
    "Profesor/a",
    "Administrador/a",
  ];
  String ValorTipoCuenta = "";
  @override
  void initState() {
    valorCurso = listaCursos.first;
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade100,
      appBar: AppBar(
        backgroundColor: Color(0xFF364562),
        title: Text('Registrarse'),
        centerTitle: true,
        elevation: 8,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                  border: Border.all(color: Colors.black)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  campoemail(),
                  camponombre(),
                  campoapellido(),
                  campodni(),
                  //          _botonDesplegableTipoCuenta(),
                  _botonDesplegableCurso(),
                  campocontrasena(),
                  campoconfirmacioncontrasena(),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed("/CrearCuenta");
                        },
                        child: Text('Crear Cuenta'),
                        style: TextButton.styleFrom(
                          primary: Color(0xFF364562),
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget campoemail() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      child: TextField(
        decoration: InputDecoration(
            hintText: "Email",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Colors.white, width: 1),
            )),
      ),
    );
  }

  Widget camponombre() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      child: TextField(
        decoration: InputDecoration(
            hintText: "Nombre",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Colors.white, width: 1),
            )),
      ),
    );
  }

  Widget campoapellido() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      child: TextField(
        decoration: InputDecoration(
            hintText: "Apellido",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Colors.white, width: 1),
            )),
      ),
    );
  }

  Widget campodni() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      child: TextField(
        decoration: InputDecoration(
            hintText: "DNI",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Colors.white, width: 1),
            )),
      ),
    );
  }

  Widget campotipocuenta() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Tipo Cuenta",
        ),
      ),
    );
  }

  Widget campocurso() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Curso",
        ),
      ),
    );
  }

  Widget campocontrasena() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      child: TextField(
        decoration: InputDecoration(
            hintText: "Ingrese su contraseña",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Colors.white, width: 1),
            )),
      ),
    );
  }

  Widget campoconfirmacioncontrasena() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      child: TextField(
        decoration: InputDecoration(
            hintText: "Ingrese nuevamente su contraseña",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Colors.white, width: 1),
            )),
      ),
    );
  }

  Widget _botonDesplegableCurso() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(
            color: Colors.indigo.shade200,
            width: 2,
          ),
          color: Colors.white),
      child: DropdownButton<String>(
        //PERSONALIZACION
        dropdownColor: Colors.white,
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
          // _cambioDeturno(valorCurso);
        },
        value: valorCurso,
      ),
    );
  }

  Widget _botonDesplegableTipoCuenta() {
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
        items: listaTipoCuenta.map((String showedOption) {
          return DropdownMenuItem(
            value: showedOption,
            child: Text(showedOption),
          );
        }).toList(),
        onChanged: (selectedOption) {
          setState(() {
            ValorTipoCuenta = selectedOption;
          });
          // _cambioDeturno(valorCurso);
        },
        value: valorCurso,
      ),
    );
  }
}
