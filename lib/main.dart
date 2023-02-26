import 'package:flutter/material.dart';
import 'variables.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const Home(title: 'Generadores de números pseudoaleatorios'),
    );
  }
}
class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;
  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  int option = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
                // Aquí va el código que se ejecuta cuando se presiona el quinto botón
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(200, 50), // Establecer el tamaño del botón
              ),
              child: const Text(
                'Generador 5', 
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
              onPressed: () {
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(200, 50), // Establecer el tamaño del botón
              ),
              child: const Text(
                'Generador 6', 
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
