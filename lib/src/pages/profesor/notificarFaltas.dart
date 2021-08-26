import 'package:flutter/material.dart';

class CargarFaltasPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
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
            title: Text("Cerrar Sesion"),
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
     
    );
  }
}
