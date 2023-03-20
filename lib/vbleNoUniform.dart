import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:random_generator/resutlsnoUniform.dart';
import 'numbers.dart';


// ignore: camel_case_types
class vbleNoUn extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();

  final int option;
  vbleNoUn({super.key, required this.option});
  @override
  Widget build(BuildContext context) {
    
    // ignore: no_leading_underscores_for_local_identifiers
    return Scaffold(
  
      appBar: AppBar(
        title: const Text('Generador'),
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: () { 
          
          int media = int.tryParse(_controller.text) ?? 0;
          int a = int.tryParse(_controller2.text) ?? 0;
          int b = int.tryParse(_controller3.text) ?? 0;
          int lambda = int.tryParse(_controller4.text) ?? 0;

          Navigator.push(
            context,  
            MaterialPageRoute(builder: (context) =>  resultsnoUNiform(option: option, media:media, a:a, b:b, lambda: lambda)),
          );
        },
        tooltip: 'Generar',
        child: const Icon(Icons.arrow_forward_rounded),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          if (option == 1) 
          SizedBox(
            width: 100.0,
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
                  hintText: 'Media exponencial',
                ),
              ),
            ), 
          ),
          if (option == 2) 
          SizedBox(
            width: 100.0,
            child: Align(
              alignment: const Alignment(0.3, -0.8),
              child: TextField(
                controller: _controller2,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                   FilteringTextInputFormatter.digitsOnly
                 ],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'a',
                ),
              ),
            ),
          ),
          if (option == 2) 
          SizedBox(
            width: 100.0,
            child: Align(
              alignment: const Alignment(0.3, -0.8),
              child: TextField(
                controller: _controller3,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                   FilteringTextInputFormatter.digitsOnly
                 ],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'b',
                ),
              ),
            ),
          ),
          if (option == 3) 
          SizedBox(
            width: 100.0,
            child: Align(
              alignment: const Alignment(0.3, -0.8),
              child: TextField(
                controller: _controller4,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                   FilteringTextInputFormatter.digitsOnly
                 ],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'λ',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}