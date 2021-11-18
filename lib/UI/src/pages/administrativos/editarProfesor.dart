import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schollinorder/UI/src/pages/login/event_google.dart';

class EditarDatosProfesor extends StatefulWidget {
  EditarDatosProfesor({@required this.profe});
  final QueryDocumentSnapshot profe;
  @override
  _EditarDatosProfesorState createState() =>
      _EditarDatosProfesorState(profe: profe);
}

class _EditarDatosProfesorState extends State<EditarDatosProfesor> {
  _EditarDatosProfesorState({@required this.profe});
  final QueryDocumentSnapshot profe;
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

  editarProfesor() {
    try {
      firebase.collection("profesores").doc(profe.id).update({
        'nombre': nombre.text,
        'apellido': apellido.text,
        'telefono': telefono.text,
        'dni': dni.text,
        'materia1': materia1.text,
        'materia2': materia2.text
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
              padding: const EdgeInsets.all(10),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    Center(
                      child: Text(
                        "Actulizando los datos de:",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            profe["nombre"],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            profe["apellido"],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    TextFormField(
                      controller: nombre,
                      onChanged: (v) {},
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
                          } else {
                            print("error");
                          }

                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text("Editar Profesor"),
                              content: Text(
                                  "¿Seguro que desea editar este profesor?"),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      editarProfesor();
                                      nombre.clear();
                                      apellido.clear();
                                      telefono.clear();
                                      dni.clear();
                                      materia1.clear();
                                      materia2.clear();
                                      Navigator.of(context)
                                          .pushReplacementNamed(
                                              "/Administrativos");
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
                        child: Text(
                          "Actualiza Los datos",
                          style: TextStyle(color: Colors.black),
                        ),
                        style: TextButton.styleFrom(
                            elevation: 1,
                            backgroundColor: Colors.indigo.shade300),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
