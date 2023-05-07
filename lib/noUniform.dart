import 'package:flutter/material.dart';
import 'package:random_generator/vbleNoUniform.dart';



// ignore: must_be_immutable, camel_case_types
class noUniform extends StatelessWidget {
  int option = 0, interval= 0;
  noUniform({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generación de variables aleatorias no-uniformes'),
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
                MaterialPageRoute(builder: (context) => vbleNoUn(option: option)), // Navegar a la nueva pantalla
              );// Aquí va el código que se ejecuta cuando se presiona el primer botón
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(200, 50), // Establecer el tamaño del botón
              ),
              child: const Text(
                'Distribución exponencial', 
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                option = 2;
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => vbleNoUn(option: option)), // Navegar a la nueva pantalla
              );
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(200, 50), // Establecer el tamaño del botón
              ),
              child: const Text(
                'Distribución uniforme', 
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                option = 3;
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => vbleNoUn(option:option)), // Navegar a la nueva pantalla
              );
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(200, 50), // Establecer el tamaño del botón
              ),
              child: const Text(
                'Poisson', 
                textAlign: TextAlign.center,
              ),
            ),
  
          ],
        ),
      ),
    );
  }
}