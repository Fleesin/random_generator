import 'package:flutter/material.dart';
import 'dart:io';
import 'package:excel/excel.dart';

// ignore: camel_case_types
class numbers extends StatelessWidget {
  final int x, a, b,c, m, x1;
  final int option;
  const numbers(int x_0, {super.key, required this.x, required this.a, required this.b,required this.c, required this.m, required this.option, required this.x1});
    List<int> congruencialMixto(int a, int c, int m, int semilla, int n) {
    List<int> numerosAleatorios = [];
    int x = semilla;
    for (int i = 0; i < n; i++) {
      x = (a * x + c) % m;
      numerosAleatorios.add(x);
    }
    return numerosAleatorios;
  }
List<int> cuadradoMedio(int semilla, int n) {
  List<int> numerosAleatorios = [];
  int x = semilla;
  String d2, d3;
  int x2, tam2, extraer, gen, tam1;
  tam1 = semilla.toString().length;
  for (int i = 1; i <= n; i++) {
    x2 = x * x;
    d2 = x2.toString();
    tam2 = d2.length;
    extraer = ((tam2-tam1)/2).round();
    d3 = d2.substring(extraer, extraer + tam1);
    gen = int.parse(d3);
    numerosAleatorios.add(gen);
    x = gen;   
  }
  return numerosAleatorios;
}
List<int> productosMedios(int semilla1, int semilla2, int n) {
  List<int> numerosAleatorios = [];
  int x1 = semilla1;
  int x2 = semilla2;
  String d2, d3;
  int x3, tam2, extraer, gen, tam1;
  tam1 = x1.toString().length;
  for (int i = 1; i < n; i++) {
    x3 = x1*x2;
    d2 = x3.toString();
    tam2 = d2.length;
    extraer = ((tam2-tam1)/2).round();
    d3 = d2.substring(extraer,extraer+tam1);
    gen = int.parse(d3);
    numerosAleatorios.add(gen);
    extraer = 0;
    x1 = x2;
    x2 = gen;  
  }
  return numerosAleatorios;
}
List<int> multiplicadorConstante(int semilla, int a, int n) {
    int xn = semilla;
    int yn;
    String d2, d3;
    int x3, tam2, extraer, gen, tam1;
    List<int> numerosGenerados = [];
    
    for (int i = 1; i < n; i++) {
      tam1 = xn.toString().length;
      yn = xn * a;
      d2 = yn.toString();
      tam2 = d2.length;
      extraer = ((tam2-tam1)/2).round();
      d3 = d2.substring(extraer,extraer+tam1);
      gen = int.parse(d3);
      numerosGenerados.add(gen);
      extraer = 0;
      a = gen; 
    }
    return numerosGenerados;
  }

List<int> congruenciaCuadratica(int semilla, int a, int b, int m, int n, int c) {
    int xn = semilla;
    List<int> numerosGenerados = []; // lista para guardar los números generados
    for (int i = 0; i < n; i++) {
      xn = (a * xn * xn + b * xn + c) % m;
      numerosGenerados.add(xn); // agregamos el número generado a la lista
    }
    return numerosGenerados;
  }
void exportList(List<int> list, String filename){ 
  final excel = Excel.createExcel();
  final sheet = excel['Sheet1'];
  sheet.cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 0)).value = 'Números';
  for (int i = 0; i < list.length; i++){
    final cellIndex = CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: i+1);
    sheet.cell(cellIndex).value = list[i];
  }
  final file = File(filename);
  file.existsSync();
  File(filename).create(recursive:true);
  file.writeAsBytesSync(excel.encode()!);
}


  @override
  Widget build(BuildContext context) {
    
    List<int> numGenerator = [];

    if(option == 1 || option == 2) {
      numGenerator = congruencialMixto(a, c, m, x, 100);
    }
    if(option == 3) {
      numGenerator = cuadradoMedio(x, 20);
    }
    if(option == 4) {
      numGenerator = productosMedios(x, x1, 20);
    }
    if(option == 5) {
      numGenerator = congruenciaCuadratica(x, a, b, m, 20, c);
    }
    if(option == 6) {
      numGenerator = multiplicadorConstante(x, a, 20);
    }
    
    
    
    // ignore: no_leading_underscores_for_local_identifiers
    return Scaffold(
      appBar: AppBar(
        
        title: const Text('Results'),
      ),
      
      floatingActionButton: FloatingActionButton(
        
        onPressed: () {
          exportList(numGenerator, 'Archivos/numeros.xlsx');
        },
        tooltip: 'Exportar a excel',
        child: const Icon(Icons.archive_outlined),
      ), 
      body: Column(
        
            children: <Widget>[
              // Text(
              // "X_0 = $x \t a = $a \t c = $c \t m = $m"
              // ),
              const Text('NÚMEROS GENERADOS'),
              
              Expanded(
                child: SingleChildScrollView(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                  // Especificamos la cantidad de elementos que tendrá la lista
                  itemCount: numGenerator.length,
                  // Definimos cómo se construirá cada elemento de la lista
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(numGenerator[index].toString()),
                    );
                  },),
                ),
              )
            ],
          )
    );
  }
}

