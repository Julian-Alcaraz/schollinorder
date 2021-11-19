import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schollinorder/UI/src/pages/login/event_google.dart';

class CargarDatosProfesor extends StatefulWidget {
  @override
  _CargarDatosProfesorState createState() => _CargarDatosProfesorState();
}

class _CargarDatosProfesorState extends State<CargarDatosProfesor> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final controller = Get.put(Controller());

  TextEditingController nombre = TextEditingController();
  TextEditingController apellido = TextEditingController();
  TextEditingController telefono = TextEditingController();
  TextEditingController dni = TextEditingController();
  TextEditingController materia1 = TextEditingController();
  TextEditingController materia2 = TextEditingController();

  final firebase = FirebaseFirestore.instance;
  crearProfesor() async {
    try {
      //si quiero asignar el nombre del documento en .doc(poner nombre.text)
      await firebase.collection("profesores").doc().set({
        "nombre": nombre.text,
        "apellido": apellido.text,
        "telefono": telefono.text,
        "dni": dni.text,
        "materia1": materia1.text,
        "materia2": materia2.text,
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: drawer(context),
      appBar: AppBar(
        backgroundColor: Color(0xFF364562),
        leading: Container(
          width: 50,
          child: FittedBox(
            fit: BoxFit.contain,
            child: Image.asset(
              "assets/logo.jpg",
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.account_circle_rounded,
              size: 35,
            ),
            onPressed: () {
              _scaffoldKey.currentState.openEndDrawer();
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 40),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFF364562),
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(color: Colors.black, width: 3),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    TextFormField(
                      controller: nombre,
                      decoration: InputDecoration(
                        hintText: "Nombre",
                        hintStyle: TextStyle(
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 5),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      validator: (value) =>
                          value.isEmpty ? "campo requerido" : null,
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: apellido,
                      decoration: InputDecoration(
                        hintText: "Apellido",
                        hintStyle: TextStyle(
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 5),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      validator: (value) =>
                          value.isEmpty ? "campo requerido" : null,
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: telefono,
                      decoration: InputDecoration(
                        hintText: "Telefono",
                        hintStyle: TextStyle(
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 5),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      validator: (value) =>
                          value.isEmpty ? "campo requerido" : null,
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: dni,
                      decoration: InputDecoration(
                        hintText: "DNI",
                        hintStyle: TextStyle(
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 5),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      validator: (value) =>
                          value.isEmpty ? "campo requerido" : null,
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: materia1,
                      decoration: InputDecoration(
                        hintText: "Materia 1",
                        hintStyle: TextStyle(
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 5),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      validator: (value) =>
                          value.isEmpty ? "campo requerido" : null,
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: materia2,
                      decoration: InputDecoration(
                        hintText: "Materia 2",
                        hintStyle: TextStyle(
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 5),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      validator: (value) =>
                          value.isEmpty ? "campo requerido" : null,
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            print("muy bien cargo el profesor");
                            crearProfesor();
                            nombre.clear();
                            apellido.clear();
                            telefono.clear();
                            dni.clear();
                            materia1.clear();
                            materia2.clear();
                          } else {
                            print("erro");
                          }
                        },
                        child: Text(
                          "Cargar Datos",
                          style: TextStyle(color: Colors.black),
                        ),
                        style: TextButton.styleFrom(
                            elevation: 1,
                            backgroundColor: Colors.indigo.shade300),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
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
}
