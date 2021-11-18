import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schollinorder/UI/src/models/profesor.dart';
import 'package:schollinorder/UI/src/pages/administrativos/informacionDeProfesor.dart';
import 'package:schollinorder/UI/src/pages/login/event_google.dart';

class VerDatosProfesor2 extends StatefulWidget {
  @override
  _VerDatosProfesorState createState() => _VerDatosProfesorState();
}

class _VerDatosProfesorState extends State<VerDatosProfesor2> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _controller = TextEditingController();
  List<Profesor> listaFiltrada = [];
  final controller = Get.put(Controller());
  final firebase = FirebaseFirestore.instance;

  @override
  void initState() {
    listaFiltrada = listaProfesores;
    super.initState();
  }

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                //buscar(),
                SizedBox(height: 20),
                StreamBuilder<QuerySnapshot>(
                    stream: firebase.collection("profesores").snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            itemCount: snapshot.data.docs.length,
                            itemBuilder: (context, i) {
                              QueryDocumentSnapshot x = snapshot.data.docs[i];
                              return nombreProfesor(x);
                            });
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
                
                /* Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      resetear();
                    },
                    child: Text("Resetear Lista"),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF364562),
                    ),
                  ),
                ) */
              ],
            ),
          ),
        ),
      ),
    );
  }

  void resetear() {
    listaFiltrada = listaProfesores;
    setState(() {});
  }

  /* Widget verListaProfesores(List<Profesor> lista) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        height: 500,
        width: 500,
        child: ListView.builder(
            itemCount: listaFiltrada.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return nombreProfesor(lista[index]);
            }),
      ),
    );
  } */

  Widget nombreProfesor(QueryDocumentSnapshot profe) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => InformacionProfesor(
                    profe: profe,
                  )));
        },
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: Color((0xFF364562)),
          ),
          child: Center(
            child: Text(
              profe["nombre"],
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  void filtroLista() {
    listaFiltrada = [];
    for (Profesor item in listaProfesores) {
      if (item.nombre.toLowerCase().contains(_controller.text.toLowerCase())) {
        listaFiltrada.add(item);
      }
    }
    setState(() {});
  }

  Widget buscar() {
    return Container(
      child: TextFormField(
        onFieldSubmitted: (nombreProfe) {
          filtroLista();
        },
        controller: _controller,
        onChanged: (v) {
          print(_controller.text);
        },
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
          ),
          hintText: "Buscar Profesor por Nombre",
          hintStyle:
              TextStyle(color: Colors.black, fontSize: 15, letterSpacing: 0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: Colors.black,
              width: 2,
            ),
          ),
          fillColor: Colors.white,
          filled: true,
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
