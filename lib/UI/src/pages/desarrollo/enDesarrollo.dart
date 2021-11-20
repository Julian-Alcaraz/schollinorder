import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schollinorder/UI/src/pages/login/event_google.dart';

class DesarroloPage extends StatefulWidget {
  @override
  _DesarroloPageState createState() => _DesarroloPageState();
}

class _DesarroloPageState extends State<DesarroloPage> {
  final controller = Get.put(Controller());

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: drawer(context),
      appBar: appBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Pagina en Desarrollo",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 20,
              ),
            ),
            Text(
              "Proximamente en funcionamiento",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 20,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed("/Home");
                },
                child: Text("Vuela a Home"))
          ],
        ),
      ),
    );
  }

  Widget appBar() {
    return AppBar(
      leading: Image.asset(
        "assets/logo.jpg",
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(10),
          topRight: Radius.circular(10),
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
