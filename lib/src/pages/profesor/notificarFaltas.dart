import 'package:flutter/material.dart';

class CargarFaltasPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String _Nombre;
  String _Apellido;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: Drawer(
          child: Column(
        children: [
          DrawerHeader(child: Text("Notificador de Faltas")),
          Spacer(),
          ListTile(
            tileColor: Color(0xFF364562),
            onTap: () {},
          ),
        ],
      )),
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
      body: Container(
        decoration: BoxDecoration(color: Colors.blue),
        child: Center(
          child: Column(
            children: [
              Container(
                height: 500,
                width: 500,
                decoration: BoxDecoration(color: Colors.amber),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Form(
                    child: Column(
                      
                    ),
                  ),
                ),
              ),
              _DatosDeLaFaltas(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _DatosDeLaFaltas() {
    return Container(
      margin: EdgeInsets.only(top: 30, bottom: 30),
      padding: EdgeInsets.all(12),
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.indigo.shade200,
          width: 3,
        ),
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.indigo.shade100,
      ),
      child: Text(
        "Datos de la Falta",
        style: TextStyle(
          fontSize: 30,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
