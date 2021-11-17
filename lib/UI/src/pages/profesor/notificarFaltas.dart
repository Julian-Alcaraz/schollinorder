//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schollinorder/UI/src/pages/login/event_google.dart';

class CargarFaltasPage extends StatefulWidget {
  @override
  _CargarFaltasPageState createState() => _CargarFaltasPageState();
}

class _CargarFaltasPageState extends State<CargarFaltasPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  // ignore: unused_field
  var _currentSelectedDate;

  void callDatePicker() async {
    var selectDate = await getDatePickerWiget();
    setState(() {
      _currentSelectedDate = selectDate;
    });
  }

  Future<DateTime> getDatePickerWiget() {
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2023),
      builder: (context, child) {
        return Theme(data: ThemeData.dark(), child: child);
      },
    );
  }

  String nameValue;
  String lastnameValue;
  final controller = Get.put(Controller());

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: drawer(context),
      appBar: AppBar(
        leading: Container(
          width: 50,
          child: FittedBox(
            fit: BoxFit.contain,
            child: Image.asset(
              "assets/logo.jpg",
            ),
          ),
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
      ),
      body: ListView(
        children: [
          Center(
            child: _datosDeLaFaltas(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              width: 500,
              height: 550,
              decoration: BoxDecoration(
                color: Color(0xFF364562),
                borderRadius: BorderRadius.all(Radius.circular(15)),
                border: Border.all(
                  color: Colors.black,
                  width: 3,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: <Widget>[
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, right: 20, left: 20),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Nombre",
                            hintStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                letterSpacing: 0),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                          validator: (value) =>
                              value.isEmpty ? "campo requerido" : null,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, right: 20, left: 20),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Apellido",
                            hintStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                letterSpacing: 0),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                          validator: (value) =>
                              value.isEmpty ? "campo requerido" : null,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, right: 20, left: 20),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "DNI",
                            hintStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                letterSpacing: 0),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                          validator: (value) =>
                              value.isEmpty ? "campo requerido" : null,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, right: 20, left: 20),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Motivo",
                            hintStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                letterSpacing: 0),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                          validator: (value) =>
                              value.isEmpty ? "campo requerido" : null,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, right: 20, left: 20),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Curso",
                            hintStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                letterSpacing: 0),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                          validator: (value) =>
                              value.isEmpty ? "campo requerido" : null,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, right: 20, left: 20),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Materia",
                            hintStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                letterSpacing: 0),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                          validator: (value) =>
                              value.isEmpty ? "campo requerido" : null,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: callDatePicker,
                            style: ElevatedButton.styleFrom(
                              primary: Colors.black,
                              onPrimary: Colors.black,
                            ),
                            child: Text(
                              "Seleccione fecha",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      Center(
                        child: ElevatedButton(
                          child: Text(
                            "enviar a administrador",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              print("muy bien notificar faltas");
                            } else {
                              print("erro");
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.indigo.shade100,
                            onPrimary: Colors.black,
                            minimumSize: Size(200, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          //Spacer(),
          Container(
            //boton ir home
            child: Center(
              child: ElevatedButton(
                  child: Text("Ir a home"),
                  onPressed: () {
                    Navigator.of(context).pop("/Home");
                  }),
            ),
          ),
        ],
      ),
    );
  }

  Widget drawer(context) {
    return Drawer(
      child: Material(
        color: Colors.indigo.shade100,
        child: Column(
          children: [
            DrawerHeader(
              child: Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      maxRadius: 58,
                      backgroundImage: Image.network(
                              controller.googleAccount.value.photoUrl ?? '')
                          .image,
                    ),
                    Text(controller.googleAccount.value.displayName ?? '',
                        style: Get.textTheme.headline3),
                  ],
                ),
              ),
            ),
            ListTile(
              focusColor: Colors.amber,
              title: Text("Datos Personales"),
              tileColor: Colors.indigo.shade300,
              onTap: () {
                Navigator.of(context).pushReplacementNamed("/DatosPersonales");
              },
            ),
            Spacer(),
            ListTile(
              focusColor: Colors.amber,
              title: Text("Cerrar Sesion"),
              tileColor: Color(0xFF364562),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Cerrar Sesion"),
                    content: Text("¿Seguro que desea cerrar la sesion?"),
                    actions: [
                      TextButton(
                          onPressed: () {
                            controller.logut();
                            Navigator.of(context)
                                .pushReplacementNamed("/Login");
                          },
                          child: Text("Si")),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("No")),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _datosDeLaFaltas() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.indigo.shade200,
            width: 3,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.indigo.shade100,
        ),
        child: Center(
          child: Text(
            "Datos de la Falta",
            style: TextStyle(
              fontSize: 30,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
