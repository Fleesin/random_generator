import 'dart:math';

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
  final TextEditingController _controller6 = TextEditingController();

  final int option;
  variables(int option_, {super.key, required this.option});


  void esprimo (BuildContext context, x, a, b, c, m , option, x1){
    if (option == 1){
      for (int i = 2; i <=sqrt(x) || i <=sqrt(a) || i <=sqrt(c) || i <=sqrt(m); i++){
          if(x % i == 0 || a % i == 0 || c % i == 0 || m % i == 0 ){
            if(x == 2 || a == 2 || c == 2 || m == 2 || x == 3 || a == 3 || c == 3 || m == 3){
              break;
            }
            _Alert(context, x, a, b, c, m, option, x1);
            break;
        }
      }
    }
    if (option == 2){
      for (int i = 2; i <=sqrt(x) || i <=sqrt(a) || i <=sqrt(m); i++){
          if(x % i == 0 || a % i == 0 || m % i == 0){
            if(x == 2 || a == 2 || m == 2 || x == 3 || a == 3 || m == 3){
              break;
            }
            _Alert(context, x, a, b, c, m, option, x1);
          break;
        }
      }
    }
    if (option == 5){
      for (int i = 2; i <=sqrt(x) || i <=sqrt(a) || i <=sqrt(b) || i <=sqrt(c) || i <=sqrt(m); i++){
          if(x % i == 0 || a % i == 0 || b % i == 0 || c % i == 0 || m % i == 0){
            if(x == 2 || a == 2 || b == 2|| c == 2 || m == 2 || x == 3 || a == 3 || b == 2 || c == 3 || m == 3){
              break;
            }
            _Alert(context, x, a, b, c, m, option, x1);
          break;
        }
      }
    }
  }

  void fourdigits(BuildContext context, x, a, b, c, m , option, x1){
    if (x < 999 && option == 3){
      _Alert2(context, x, a, b, c, m, option, x1);
    }
    if ((x1 < 999 || x < 999) && option == 4){
      _Alert2(context, x, a, b, c, m, option, x1);
    }
    if ((x < 999 || a < 999) && option == 6 ){
      _Alert2(context, x, a, b, c, m, option, x1);
    }
  }

  void mvalid(BuildContext context, x, a, b, c, m , option, x1){
    if (m < x1 || m < a || m < a){
      _Alert3(context, x, a, b, c, m, option, x1);
    }
  }
  void avalid(BuildContext context, x, a, b, c, m , option, x1){
    if (a < c ){
      _Alert4(context, x, a, b, c, m, option, x1);
    }
    if (a % 2 == 0 || a % 3 == 0 || a % 5 == 0){
      _Alert5(context, x, a, b, c, m, option, x1);
    }
  }

  void cvalid(BuildContext context, x, a, b, c, m , option, x1){
    if (c % 8 != 5){
      _Alert6(context, x, a, b, c, m, option, x1);
    }
  }
  void xvalid(BuildContext context, x, a, b, c, m , option, x1){
    if(option == 2){
      if (x % 2 == 0 || x == 5){
        _Alert7(context, x, a, b, c, m, option, x1);
      }
      if (x == m){
        _Alert8(context, x, a, b, c, m, option, x1);
      }
    }
  }
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
          int b = int.tryParse(_controller6.text) ?? 0;
          
          
          
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  numbers(x0, x:x0, a:a, b:b, c:c, m:m, option:option, x1: x1)),
          );
          mvalid(context, x0, a, b, c, m, option, x1);
          avalid(context, x0, a, b, c, m, option, x1);
          cvalid(context, x0, a, b, c, m, option, x1);
          xvalid(context, x0, a, b, c, m, option, x1);
          fourdigits(context, x0, a, b, c, m, option, x1);
          esprimo(context, x0, a, b, c, m, option, x1);
          
        },
        tooltip: 'Generar',
        child: const Icon(Icons.arrow_forward_rounded),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        
        children: <Widget>[
          if (option == 1 || option == 2 || option == 3 || option == 4 || option == 5 || option == 6) 
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
          if (option == 1 || option == 2 || option == 5 || option == 6) 
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
          if (option == 5) 
          SizedBox(
            width: 100.0,
            child: Align(
              alignment: const Alignment(0.3, -0.8),
              child: TextField(
                controller: _controller6,
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
          if (option == 1 || option == 5)
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
          if (option == 1 || option == 2 || option == 5)  
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

// ignore: non_constant_identifier_names
void _Alert(BuildContext context, x0, a, b, c, m , option, x1) {
  // Configura el AlertDialog
  AlertDialog dialog = AlertDialog(
    title: const Text('Advertencia'),
    content: const Text('Alguna de las varibles no es primo'),
    actions: [
      TextButton(
        child: const Text('Continuar'),
        onPressed: () {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  numbers(x0, x:x0, a:a, b:b, c:c, m:m, option:option, x1: x1)),
          );
          
        },
      ),
    ],
  );
showDialog(
    context: context,
    builder: (BuildContext context) {
      return dialog;
    },
  );
}

// ignore: non_constant_identifier_names
void _Alert2(BuildContext context, x0, a, b, c, m , option, x1) {
  // Configura el AlertDialog
  AlertDialog dialog = AlertDialog(
    title: const Text('Advertencia'),
    content: const Text('Uno de los números no es mayor a tres dígitos'),
    actions: [
      TextButton(
        child: const Text('Continuar'),
        onPressed: () {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  numbers(x0, x:x0, a:a, b:b, c:c, m:m, option:option, x1: x1)),
          );
          
        },
      ),
    ],
  );
showDialog(
    context: context,
    builder: (BuildContext context) {
      return dialog;
    },
  );
}

void _Alert3(BuildContext context, x0, a, b, c, m , option, x1) {
  // Configura el AlertDialog
  AlertDialog dialog = AlertDialog(
    title: const Text('Advertencia'),
    content: const Text('m tiene que ser mayor que x, a y c'),
    actions: [
      TextButton(
        child: const Text('Continuar'),
        onPressed: () {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  numbers(x0, x:x0, a:a, b:b, c:c, m:m, option:option, x1: x1)),
          );
          
        },
      ),
    ],
  );
showDialog(
    context: context,
    builder: (BuildContext context) {
      return dialog;
    },
  );
}

void _Alert4(BuildContext context, x0, a, b, c, m , option, x1) {
  // Configura el AlertDialog
  AlertDialog dialog = AlertDialog(
    title: const Text('Advertencia'),
    content: const Text('a tiene que ser mayor a c'),
    actions: [
      TextButton(
        child: const Text('Continuar'),
        onPressed: () {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  numbers(x0, x:x0, a:a, b:b, c:c, m:m, option:option, x1: x1)),
          );
          
        },
      ),
    ],
  );
showDialog(
    context: context,
    builder: (BuildContext context) {
      return dialog;
    },
  );
}

void _Alert5(BuildContext context, x0, a, b, c, m , option, x1) {
  // Configura el AlertDialog
  AlertDialog dialog = AlertDialog(
    title: const Text('Advertencia'),
    content: const Text('a debe ser impar no divisible por 3 y 5'),
    actions: [
      TextButton(
        child: const Text('Continuar'),
        onPressed: () {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  numbers(x0, x:x0, a:a, b:b, c:c, m:m, option:option, x1: x1)),
          );
          
        },
      ),
    ],
  );
showDialog(
    context: context,
    builder: (BuildContext context) {
      return dialog;
    },
  );
}

void _Alert6(BuildContext context, x0, a, b, c, m , option, x1) {
  // Configura el AlertDialog
  AlertDialog dialog = AlertDialog(
    title: const Text('Advertencia'),
    content: const Text('c al dividirlo por 8 el residuo debe ser 5'),
    actions: [
      TextButton(
        child: const Text('Continuar'),
        onPressed: () {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  numbers(x0, x:x0, a:a, b:b, c:c, m:m, option:option, x1: x1)),
          );
          
        },
      ),
    ],
  );
showDialog(
    context: context,
    builder: (BuildContext context) {
      return dialog;
    },
  );
}

void _Alert7(BuildContext context, x0, a, b, c, m , option, x1) {
  // Configura el AlertDialog
  AlertDialog dialog = AlertDialog(
    title: const Text('Advertencia'),
    content: const Text('Debe ser impar y no divisible entre 2 y 5'),
    actions: [
      TextButton(
        child: const Text('Continuar'),
        onPressed: () {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  numbers(x0, x:x0, a:a, b:b, c:c, m:m, option:option, x1: x1)),
          );
          
        },
      ),
    ],
  );
showDialog(
    context: context,
    builder: (BuildContext context) {
      return dialog;
    },
  );
}
void _Alert8(BuildContext context, x0, a, b, c, m , option, x1) {
  // Configura el AlertDialog
  AlertDialog dialog = AlertDialog(
    title: const Text('Advertencia'),
    content: const Text('X y m deben ser coprimos'),
    actions: [
      TextButton(
        child: const Text('Continuar'),
        onPressed: () {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  numbers(x0, x:x0, a:a, b:b, c:c, m:m, option:option, x1: x1)),
          );
          
        },
      ),
    ],
  );
showDialog(
    context: context,
    builder: (BuildContext context) {
      return dialog;
    },
  );
}