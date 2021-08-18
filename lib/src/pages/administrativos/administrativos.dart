import 'package:flutter/material.dart';

class AdministrativosPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 50, horizontal: 25),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    primary: Color(0xFF364562), minimumSize: Size(200, 95)),
                child: Text(
                  "Cargar datos \nde profesor ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: (20),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    primary: Color(0xFF364562), minimumSize: Size(200, 95)),
                child: Text(
                  "Ver datos \nde profesor ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: (20),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    primary: Color(0xFF364562), minimumSize: Size(200, 95)),
                child: Text(
                  "Cargar datos\nde profesores ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: (20),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    primary: Color(0xFF364562), minimumSize: Size(200, 95)),
                child: Text(
                  "Modificar \nhorario de curso ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: (20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
