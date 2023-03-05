import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:excel/excel.dart';

// ignore: must_be_immutable, camel_case_types


double statistics_prom (List<int> lista, data){
  double promedio, Z;
    for (final row in data) {
      print(row);
      lista.add(row);
    }
    final _lista = lista.map((elemento) => elemento / (lista.length + 1)).toList();
    final suma = _lista.reduce((valorAcumulado, elemento) => valorAcumulado + elemento);
    promedio = suma / lista.length;
    print(promedio);
    return (promedio);
}

class results extends StatelessWidget {
  
  int option = 0;
  results({super.key, required this.option});
  
  
  @override
  Widget build(BuildContext context) {
    // Cargar datos desde un archivo de Excel
    final bytes = File('Archivos/numeros.xlsx').readAsBytesSync();
    final excel = Excel.decodeBytes(bytes);
    final hoja = excel.tables['Sheet1'];
    final data = hoja?.rows.map((row) => row[0]?.value).where((valor) => valor is num).toList() ?? [];
    final lista = <int>[];
    double promedio = statistics_prom(lista, data);
    double  Z = ((promedio - 0.5)*sqrt(lista.length))/sqrt(1/12);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultados estadísticos'),
      ),
      body: Column(
        children: <Widget> [
          Text('\n\n El promedio es de $promedio \n \n El Z es de $Z'),
          Expanded(
                child: SingleChildScrollView(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                  itemCount: lista.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(lista[index].toString()),
                    );
                  },),
                ),
              )
      ],)
    );
  }
}