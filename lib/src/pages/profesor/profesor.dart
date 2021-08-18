import 'package:flutter/material.dart';

class ProfesorPage extends StatelessWidget {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
         endDrawer: Drawer(
          child: Column(
        children: [
          DrawerHeader(child: Text("Bienvenido Profesor")),
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
           backgroundColor: Color (0xFF364562), // color del appbar fondo
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
        child: Center(
          child: Column(
            children: [
              _horarioclases(),
            ],
          ),
          
        ),
      ),
    );
  }
  Widget _horarioclases (){
   return Container (
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
       "horario de clases" ,
       style: TextStyle(
          fontSize: 30,
          color: Colors.black,
          
        ),
       ), 
   );
  }
  
}
