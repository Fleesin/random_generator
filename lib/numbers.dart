import 'package:flutter/material.dart';
import 'dart:io';
import 'package:excel/excel.dart';

// ignore: camel_case_types
class numbers extends StatelessWidget {
  final int x, a, c, m, x1;
  final int option;
  const numbers(int x_0, {super.key, required this.x, required this.a, required this.c, required this.m, required this.option, required this.x1});
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
  tam1 = x.toString().length;
  for (int i = 0; i < n; i++) {
    x2 = x*x;
    d2 = x2.toString();
    tam2 = d2.length;
    extraer = (tam2-tam1)~/2;
    d3 = d2.substring(extraer,extraer+tam1);
    gen = int.parse(d3);
    numerosAleatorios.add(gen);
    x = gen;  
  }
  return numerosAleatorios;
}
List<int> productosMedios(int semilla1, int semilla2, int n) {
  int x1 = semilla1;
  int x2 = semilla2;
  int producto, gen;
  List<int> resultados = [];

  // Se multiplica las semillas y se toman las cifras centrales
  for (int i = 0; i < n; i++) {
    producto = x1 * x2;
    x1 = x2;
    x2 = producto % 100000;
    gen = x2 ~/ 10;
    resultados.add(gen);

  }

  return resultados;
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
      numGenerator = congruencialMixto(a, c, m, x, 20);
    }
    if(option == 3) {
      numGenerator = cuadradoMedio(x, 20);
    }
    if(option == 4) {
      numGenerator = productosMedios(x, x1,20);
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
