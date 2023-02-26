import 'package:flutter/material.dart';
import 'dart:io';
import 'package:excel/excel.dart';

// ignore: camel_case_types
class numbers extends StatelessWidget {
  final int x, a, c, m;
  const numbers(int x_0, {super.key, required this.x, required this.a, required this.c, required this.m});
    List<int> congruencialMixto(int a, int c, int m, int semilla, int n) {
    List<int> numerosAleatorios = [];
    int x = semilla;
    for (int i = 0; i < n; i++) {
      x = (a * x + c) % m;
      numerosAleatorios.add(x);
    }
    return numerosAleatorios;
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
    List<int> numGenerator = congruencialMixto(a, c, m, x, 20);
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
              Text(
              "X_0 es $x \t a es $a \t c es $c \t m es $m"
              ),
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
