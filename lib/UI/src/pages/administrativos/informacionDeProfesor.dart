import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class InformacionProfesor extends StatelessWidget {
  InformacionProfesor({@required this.profe});
  final firebase = FirebaseFirestore.instance;
  final QueryDocumentSnapshot profe;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xFF364562), actions: [
        Container(
          width: 50,
          child: FittedBox(
            fit: BoxFit.contain,
            child: Image.asset(
              "assets/logo.jpg",
            ),
          ),
        ),
      ]),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 100),
        child: Container(
          width: 500,
          decoration: BoxDecoration(
            color: Color(0xFF364562),
            borderRadius: BorderRadius.all(Radius.circular(20)),
            border: Border.all(color: Colors.black, width: 3),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Nombre: ",
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              SizedBox(height: 8),
              Container(
                height: 35,
                width: 280,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Text(
                  profe["nombre"],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Apellido:",
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              SizedBox(height: 8),
              Container(
                height: 35,
                width: 280,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Text(
                  profe["apellido"],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Numero:",
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(height: 8),
              Container(
                height: 35,
                width: 280,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Text(
                  profe["telefono"],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Text(
                "DNI:",
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(height: 8),
              Container(
                height: 35,
                width: 280,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Text(
                  profe["dni"],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Materia 1:",
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(height: 8),
              Container(
                height: 35,
                width: 280,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Text(
                  profe["materia1"],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Materia 2:",
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(height: 8),
              Container(
                height: 35,
                width: 280,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Text(
                  profe["materia2"],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
