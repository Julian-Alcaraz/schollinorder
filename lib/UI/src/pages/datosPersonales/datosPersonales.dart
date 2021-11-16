import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schollinorder/UI/src/pages/login/event_google.dart';

class DatosPersonales extends StatefulWidget {
  @override
  State<DatosPersonales> createState() => _DatosPersonalesState();
}

class _DatosPersonalesState extends State<DatosPersonales> {
  final controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xFF364562),
          leading: Image.asset(
            "assets/logo.jpg",
          ),
          title: Text(
            "Pagina de redireccionamiento",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: CircleAvatar(
                  backgroundImage: Image.network(
                          controller.googleAccount.value.photoUrl ?? '')
                      .image,
                  radius: 100,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Nombre Usuario: ",
                style: TextStyle(fontSize: 25),
              ),
              Text(
                controller.googleAccount.value.displayName ?? '',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              Text(
                "Mail: ",
                style: TextStyle(fontSize: 25),
              ),
              Text(controller.googleAccount.value.email ?? '',
                  style: TextStyle(fontSize: 20)),
            ],
          ),
        ));
  }
}
