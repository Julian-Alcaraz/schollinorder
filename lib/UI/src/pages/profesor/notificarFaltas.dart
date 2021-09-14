import 'package:flutter/material.dart';

class CargarFaltasPage extends StatefulWidget {
  @override
  _CargarFaltasPageState createState() => _CargarFaltasPageState();
}

class _CargarFaltasPageState extends State<CargarFaltasPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var _currenSelecDate;
  void callDatepicker() async {
    var selectedDate = await getDatepickerwidget();
    setState(() {
      _currenSelecDate = selectedDate;
    });
  }

  Future<DateTime> getDatepickerwidget() {
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2021),
      builder: (context, child) {
        return Theme(data: ThemeData.dark(), child: child);
      },
    );
  }

  String nameValue;
  String lastnameValue;

  final formKey = GlobalKey<FormState>();

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
      body: ListView(
        children: [
          Center(
            child: _datosDeLaFaltas(),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              width: 500,
              height: 520,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                border: Border.all(
                  color: Colors.black,
                  width: 6,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: <Widget>[
                      Center(
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 45),
                              child: Text("Nombre"),
                            ),
                            Container(
                              height: 40,
                              width: 150,
                              margin:
                                  EdgeInsets.only(bottom: 17, left: 5, top: 8),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: "Nombre",
                                  hintStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      letterSpacing: 0),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 1),
                                  ),
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                                onSaved: (value) {
                                  lastnameValue = value;
                                },
                                validator: (value) {
                                  String ejemplo = "";
                                  if (value.isEmpty) {
                                    ejemplo = "llene este campo";
                                  }
                                  return ejemplo;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 45),
                            child: Text("Apellido"),
                          ),
                          Container(
                            height: 40,
                            width: 150,
                            margin:
                                EdgeInsets.only(bottom: 17, left: 5, top: 8),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Apellido",
                                hintStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    letterSpacing: 0),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 1),
                                ),
                                fillColor: Colors.white,
                                filled: true,
                              ),
                              onSaved: (value) {
                                lastnameValue = value;
                              },
                              validator: (value) {
                                String ejemplo = "";
                                if (value.isEmpty) {
                                  ejemplo = "llene este campo";
                                }
                                return ejemplo;
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 70),
                            child: Text("DNI"),
                          ),
                          Container(
                            height: 40,
                            width: 150,
                            margin:
                                EdgeInsets.only(bottom: 17, left: 5, top: 8),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "DNI",
                                hintStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    letterSpacing: 0),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 1),
                                ),
                                fillColor: Colors.white,
                                filled: true,
                              ),
                              onSaved: (value) {
                                lastnameValue = value;
                              },
                              validator: (value) {
                                String ejemplo = "";
                                if (value.isEmpty) {
                                  ejemplo = "llene este campo";
                                }
                                return ejemplo;
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 52),
                            child: Text("Motivo"),
                          ),
                          Container(
                            height: 40,
                            width: 150,
                            margin:
                                EdgeInsets.only(bottom: 17, left: 5, top: 8),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Motivo",
                                hintStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    letterSpacing: 0),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 1),
                                ),
                                fillColor: Colors.white,
                                filled: true,
                              ),
                              onSaved: (value) {
                                lastnameValue = value;
                              },
                              validator: (value) {
                                String ejemplo = "";
                                if (value.isEmpty) {
                                  ejemplo = "llene este campo";
                                }
                                return ejemplo;
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 57),
                            child: Text("Curso"),
                          ),
                          Container(
                            height: 40,
                            width: 150,
                            margin:
                                EdgeInsets.only(bottom: 17, left: 5, top: 8),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Curso",
                                hintStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    letterSpacing: 0),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 1),
                                ),
                                fillColor: Colors.white,
                                filled: true,
                              ),
                              onSaved: (value) {
                                lastnameValue = value;
                              },
                              validator: (value) {
                                String ejemplo = "";
                                if (value.isEmpty) {
                                  ejemplo = "llene este campo";
                                }
                                return ejemplo;
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 47),
                            child: Text("Materia"),
                          ),
                          Container(
                            height: 40,
                            width: 150,
                            margin:
                                EdgeInsets.only(bottom: 17, left: 5, top: 8),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Materia",
                                hintStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    letterSpacing: 0),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 1),
                                ),
                                fillColor: Colors.white,
                                filled: true,
                              ),
                              onSaved: (value) {
                                lastnameValue = value;
                              },
                              validator: (value) {
                                String ejemplo = "";
                                if (value.isEmpty) {
                                  ejemplo = "llene este campo";
                                }
                                return ejemplo;
                              },
                            ),
                          ),
                        ],
                      ),
                      TextButton(
                          onPressed: callDatepicker,
                          child: Text("Seleccione fecha de Falta")),
                      ElevatedButton(
                        child: Text(
                          "enviar a administrador",
                          style: TextStyle(fontSize: 18),
                        ),
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Colors.indigo.shade100,
                          onPrimary: Colors.black,
                          minimumSize: Size(200, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Spacer(),
          Container(
            //boton ir home
            child: Center(
              child: ElevatedButton(
                  child: Text("Ir a home"),
                  onPressed: () {
                    Navigator.of(context).pop("/Home");
                  }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _datosDeLaFaltas() {
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
