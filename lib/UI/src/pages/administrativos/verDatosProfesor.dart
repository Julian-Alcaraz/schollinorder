import 'package:flutter/material.dart';
import 'package:schollinorder/UI/src/models/profesor.dart';

class VerDatosProfesor extends StatefulWidget {
  @override
  _VerDatosProfesorState createState() => _VerDatosProfesorState();
}

class _VerDatosProfesorState extends State<VerDatosProfesor> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _controller = TextEditingController();
  List<Profesor> listaFiltrada = [];
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
                buscar(),
                verListaProfesores(listaFiltrada),
                Padding(
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
                )
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

  Widget verListaProfesores(List<Profesor> lista) {
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
  }

  Widget nombreProfesor(Profesor profe) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: TextButton(
        onPressed: () {
          Navigator.of(context).pushNamed("/InformacionProfesor");
        },
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: Color((0xFF364562)),
          ),
          child: Center(
            child: Text(
              "${profe.nombre} ${profe.apellido}",
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
          hintText: "Buscar Profesor por",
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
