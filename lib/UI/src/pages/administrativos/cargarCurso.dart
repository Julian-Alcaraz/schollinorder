import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schollinorder/UI/src/pages/login/event_google.dart';

class CargarCursos extends StatefulWidget {
  @override
  _CargarCursosState createState() => _CargarCursosState();
}

class _CargarCursosState extends State<CargarCursos> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final controller = Get.put(Controller());
//Se define año y division como controladores.
  TextEditingController anio = TextEditingController();
  TextEditingController division = TextEditingController();

  final firebase = FirebaseFirestore.instance;

  crearCurso() async {
    try {
      //Creando la coleccion cursos y un documento con los datos año y division 
      //si quiero asignar el nombre del documento en .doc(poner nombre.text)
      await firebase.collection("cursos").doc().set({
        "anio": anio.text,
        "division": division.text,
      });
    } catch (e) {
      print(e);
    }
  }
//Elimina los datos de la coleccion curso, con la Id del curso.
  elimiarCurso(curso) {
    try {
      firebase.collection("cursos").doc(curso.id).delete();
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
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 40, right: 40),
            child: Container(
              height: 260,
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
                        controller: anio,
                        decoration: InputDecoration(
                          hintText: "Año",
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 5),
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
                        controller: division,
                        decoration: InputDecoration(
                          hintText: "Division",
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 5),
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
                            //Valida si año y division tienen valores
                            if (_formKey.currentState.validate()) {
                              print("muy bien cargo el profesor");
                              crearCurso();
                              anio.clear();
                              division.clear();
                              Fluttertoast.showToast(
                                  msg: "¡Cargo el curso Exitosamente!",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else {
                              print("erro");
                            }
                          },
                          child: Text(
                            "Cargar Curso",
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
          Center(
              child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              "¡Toca el Curso para eliminar!",
              style: TextStyle(color: Colors.blue, fontSize: 15),
            ),
          )),
          listarCursos(),
        ],
      ),
    );
  }

  Widget listarCursos() {
    return Container(
      height: 410,
      child: ListView(
        children: [
          StreamBuilder<QuerySnapshot>(
          //Escucha los datos de la coleccion cursos de la base de datos 
              stream: firebase.collection("cursos").snapshots(),
              builder: (context, snapshot) {//constructor
                if (snapshot.hasData) {//si tiene informacion
                  return ListView.builder(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemCount: snapshot.data.docs.length,//cuenta los documentos de cursos
                      itemBuilder: (context, i) {
                        QueryDocumentSnapshot x = snapshot.data.docs[i];
                        return muestroCurso(x);
                      });
                } else {
                  return Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                        Text("No cargo cursos todavia"),
                      ],
                    ),
                  );
                }
              }),
        ],
      ),
    );
  }

  Widget muestroCurso(QueryDocumentSnapshot curso) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 50, right: 50),
      child: TextButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Eliminar Curso"),
              content: Text("¿Seguro que desea Eliminarlo?"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      elimiarCurso(curso);
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
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: Color((0xFF364562)),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  curso["anio"],
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(width: 15),
                Text(
                  curso["division"],
                  style: TextStyle(color: Colors.white),
                ),
              ],
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
