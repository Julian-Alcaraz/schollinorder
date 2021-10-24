import 'package:flutter/material.dart';

class CargarDatosProfesor extends StatefulWidget {
  @override
  _CargarDatosProfesorState createState() => _CargarDatosProfesorState();
}

class _CargarDatosProfesorState extends State<CargarDatosProfesor> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

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
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 10),
                    child: TextFormField(
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
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 10),
                    child: TextFormField(
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
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 10),
                    child: TextFormField(
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
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Materia",
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
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 10),
                    child: TextFormField(
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
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          print("muy bien cargo el profesor");
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
                    CircleAvatar(maxRadius: 60),
                    Text("Nombre Administrador"),
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
