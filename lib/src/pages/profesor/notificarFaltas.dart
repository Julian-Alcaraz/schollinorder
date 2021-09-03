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
      body: Container(
        decoration: BoxDecoration(color: Colors.blue),
        child: Center(
          child: Column(
            children: [
              _DatosDeLaFaltas(),
              Container(
                height: 500,
                width: 500,
                decoration: BoxDecoration(color: Colors.amber),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(labelText: "Nombre"),
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
                        TextFormField(
                          decoration: InputDecoration(labelText: "Apellido"),
                          onSaved: (value) {
                            nameValue = value;
                          },
                          validator: (value) {
                            String ejemplo = "";
                            if (value.isEmpty) {
                              ejemplo = "llene este campo";
                            }
                            return ejemplo;
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: "Motivo"),
                          onSaved: (value) {
                            nameValue = value;
                          },
                          validator: (value) {
                            String ejemplo = "";

                            if (value.isEmpty) {
                              ejemplo = "llene este campo";
                            }
                            return ejemplo;
                          },
                        ),
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: "Seleccione imagen"),
                        ),
                        RaisedButton(
                          child: Text("enviar a administrador"),
                          onPressed: () {
                            _showSecondPsge(context);
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSecondPsge(BuildContext context) {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      Navigator.of(context).pushNamed("/second",
          arguments: CargarFaltasPage(
              name: this.nameValue, lastname: this.lastnameValue));
    }
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

  Widget Build (BuildContext context){

return SafeArea(child: Scaffold(
  body:Column(children: [
FlatButton(
  onPressed: callDatepicker,
  child: Text ("Lanzar nuestro datePicker"),
)
  ],)
  ,));


 
}
