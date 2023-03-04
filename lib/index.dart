import 'package:flutter/material.dart';
import 'variables.dart';



// ignore: must_be_immutable
class Generator extends StatelessWidget {
  int option = 0;
  Generator({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generadores'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                option = 1;
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => variables(option, option:option)), // Navegar a la nueva pantalla
              );// Aquí va el código que se ejecuta cuando se presiona el primer botón
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(200, 50), // Establecer el tamaño del botón
              ),
              child: const Text(
                'Generador congruencial mixto', 
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                option = 2;
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => variables(option, option:option)), // Navegar a la nueva pantalla
              );
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(200, 50), // Establecer el tamaño del botón
              ),
              child: const Text(
                'Generador congruencial multiplicativo', 
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                option = 3;
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => variables(option, option:option)), // Navegar a la nueva pantalla
              );
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(200, 50), // Establecer el tamaño del botón
              ),
              child: const Text(
                'Generador cuadrados medios', 
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                
                option = 4;
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => variables(option, option:option)), // Navegar a la nueva pantalla
              );
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(200, 50), // Establecer el tamaño del botón
              ),
              child: const Text(
                'Generador productos medios', 
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                  option = 5;
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => variables(option, option:option)), // Navegar a la nueva pantalla
                );
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(200, 50), // Establecer el tamaño del botón
              ),
              child: const Text(
                'Generador cuadrático no lineal', 
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                option = 6;
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => variables(option, option:option)), // Navegar a la nueva pantalla
                );
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(200, 50), // Establecer el tamaño del botón
              ),
              child: const Text(
                'Generador multiplicador constante', 
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}