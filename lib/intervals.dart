import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'results.dart';

class intervals extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  
  final int option;
  intervals(int option_, {super.key, required this.option});

  @override
  Widget build(BuildContext context) {
    
    // ignore: no_leading_underscores_for_local_identifiers
    return Scaffold(
  
      appBar: AppBar(
        title: const Text('Generador'),
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: () { 
          int interval = int.tryParse(_controller.text) ?? 0;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => results(option:option, interval:interval)), // Navegar a la nueva pantalla
          );
        },
        tooltip: 'Generar',
        child: const Icon(Icons.arrow_forward_rounded),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SizedBox(
            width: 120.0,
            child: Align(
              alignment: const Alignment(0.3, -0.8),
              child: TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '# Intervalos',
                ),
              ),
            ), 
          ),
        ],
      ),
    );
  }
}

