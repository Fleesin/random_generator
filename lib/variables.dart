import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'numbers.dart';

// ignore: camel_case_types
class variables extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
    final TextEditingController _controller5 = TextEditingController();

  final int option;
  variables(int option_, {super.key, required this.option});
  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    return Scaffold(
  
      appBar: AppBar(
        title: const Text('Generador'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () { 
          int x0 = int.tryParse(_controller.text) ?? 0;
          int a = int.tryParse(_controller2.text) ?? 0;
          int c = int.tryParse(_controller3.text) ?? 0;
          int m = int.tryParse(_controller4.text) ?? 0;
          int x1 = int.tryParse(_controller5.text) ?? 0;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  numbers(x0, x:x0, a:a, c:c, m:m, option:option, x1: x1)),
          );
        },
        tooltip: 'Generar',
        child: const Icon(Icons.arrow_forward_rounded),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        
        children: <Widget>[
          if (option == 1 || option == 2 || option == 3 || option == 4) 
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
                  hintText: 'X_0',
                ),
              ),
            ), 
          ),
          if (option == 1 || option == 2) 
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
          if (option == 1)
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
                    hintText: 'c',
                  ),
                ),
              ),
            ),
          if (option == 1 || option == 2)  
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
                  hintText: 'm',
                ),
              ),
            ),
          ),
          if (option == 4)  
          SizedBox(
            width: 100.0,
            child: Align(
              alignment: const Alignment(0.3, -0.8),
              child: TextField(
                controller: _controller5,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'X_1',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



