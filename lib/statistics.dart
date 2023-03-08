import 'package:flutter/material.dart';
import 'package:random_generator/intervals.dart';
import 'package:random_generator/results.dart';
import 'intervals.dart';

// ignore: must_be_immutable, camel_case_types
class statistics extends StatelessWidget {
  int option = 0, interval= 0;
  statistics({super.key});
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
                MaterialPageRoute(builder: (context) => results(option:option, interval: interval)), // Navegar a la nueva pantalla
              );// Aquí va el código que se ejecuta cuando se presiona el primer botón
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(200, 50), // Establecer el tamaño del botón
              ),
              child: const Text(
                'Prueba de Promedios', 
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                option = 2;
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => intervals(option, option: option,)), // Navegar a la nueva pantalla
              );
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(200, 50), // Establecer el tamaño del botón
              ),
              child: const Text(
                'Prueba de Frecuencias', 
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                option = 3;
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => results(option:option, interval: interval)), // Navegar a la nueva pantalla
              );
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(200, 50), // Establecer el tamaño del botón
              ),
              child: const Text(
                'Prueba de Kolmogorov-Smirnov', 
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                  option = 4;
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => results(option:option, interval: interval)), // Navegar a la nueva pantalla
                );
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(200, 50), // Establecer el tamaño del botón
              ),
              child: const Text(
                'Prueba de Poker', 
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                  option = 5;
                //   Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => results(option:option)), // Navegar a la nueva pantalla
                // );
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(200, 50), // Establecer el tamaño del botón
              ),
              child: const Text(
                'Option 5', 
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}