import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:excel/excel.dart';



List<double> exponencial (List<double> lista0, media){
  double x;
  List<double> lista1 = [];
  for(int i = 0; i< lista0.length; i++){
    if (lista0[i] == 0){
      x = 0;
    }
    else{
      x = (-media)*log(lista0[i]);
    }
    lista1.add(x);
  }
  return (lista1);
}

List<double> uniforme (List<double> lista0, a, b){
  double x;
  List<double> lista1 = [];
  for(int i = 0; i< lista0.length; i++){
      x = a + (b-a)*lista0[i];  
    lista1.add(x);
  }
  return (lista1);
}
BigInt factorial(int k) {
  // TODO: Faster algorithm
  if (k < 0) {
    throw ArgumentError.value(k);
  }
  if (k == 0) {
    return BigInt.one;
  }
  var result = BigInt.from(k);
  k--;
  while (k > 1) {
    result *= BigInt.from(k);
    k--;
  }
  return result;
}
class Poisson {
  List<double> lista ;
  List<double> limSup ;
  List<double> limInf ;
  List<int> listeva = [];
  Poisson(this.lista, this.limInf, this.limSup, this.listeva);
}

Poisson poisson(List<double> lista0, int lambda){
  double x = 0, e, e2;
  BigInt den;
  List<double> lista1 = [];
  List<double> limInf= [];
  List<double> limSup = [];
  List<List<double>> intervals = [];
  List<int> listeva = [];
  int contador = 0;
  for(int i = 0; i <= 50; i++){
    if(i != 0){
      limInf.add(limSup[i-1]);
    }
    else{
      limInf.add(0);
    }
    BigInt lam = BigInt.from(lambda);
    e = exp(-lambda);
    e2 = lam.pow(i).toDouble();
    den = factorial(i);
    x = (e*e2)/den.toDouble();
    // x = (exp(lambda)*pow(lambda, i))/(factorial(i));
    limSup.add(limInf[i] + x);
    lista1.add(x);
    if(limSup[i] >= 0.99 && limInf[i] >= 0.99){
      break;
    }
    
  }
  for(int i = 0; i <limInf.length; i++){
    List<double> sublist = [];
    sublist.add(limInf[i]);
    sublist.addAll(limSup.sublist(i, i+1));
    intervals.add(sublist);
  }
  
  for(int i = 0; i < lista0.length; i++){
    for(int k = 0; k < limInf.length; k++){
      if(lista0[i] >= limInf[k] && lista0[i] < limSup[k]){
        listeva.add(k);
      }
    }
  }
  print(listeva);
  
  return (Poisson(lista1, limInf, limSup, listeva));
}

class resultsnoUNiform extends StatelessWidget {
  final int option, media, a, b, lambda;
  const resultsnoUNiform({super.key, required this.option, required this.media, required this.a, required this.b, required this.lambda});
  @override
  Widget build(BuildContext context) {
    // Cargar datos desde un archivo de Excel
    final bytes = File('Archivos/numeros.xlsx').readAsBytesSync();
    final excel = Excel.decodeBytes(bytes);
    final hoja = excel.tables['Sheet1'];
    final data = hoja?.rows.map((row) => row[0]?.value).where((valor) => valor is num).toList() ?? [];
    final lista = <int>[];
    final sublist = <int>[];
    var limSup = <double>[];
    var limInf = <double>[];
    var lista1 = <double>[];
    var lista0 = <double>[];
    var listeva = <int>[];
    
    for (final row in data) {
      print(row);
      sublist.add(row);
    }
    for (int i = 0; i < sublist.length; i++) {
      if (!lista.contains(sublist[i])) {
        lista.add(sublist[i]);
      } else {
        break;
      }
    }
    int mayor = lista.reduce((a, b) => a>b ? a:b);
    lista0 = lista.map((elemento) => elemento / (mayor + 1)).toList();

    if(option == 1){
      lista1 = exponencial(lista0, media);
    }
    if(option == 2){
      lista1 = uniforme(lista0, a, b);
    }
    if(option == 3){
      var met_poisson= poisson(lista0, lambda);
      limSup = met_poisson.limSup;
      limInf = met_poisson.limInf;
      lista1 = met_poisson.lista;
      listeva = met_poisson.listeva;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultados no Uniformes'),
      ),
      body: Column(
        children: <Widget> [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Row(
                children: [
                  Expanded( 
                    child: Column(children: [
                      const Text('R'),
                      ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: lista0.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: Text('$index)'),
                            title: Text(lista0[index].toString()),
                          );
                      },),
                    ],)
                  ),
                  if(option == 1|| option == 2)
                  Expanded( 
                    child: Column(children: [
                      const Text('Números generados'),
                      ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: lista1.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: Text('$index)'),
                            title: Text(lista1[index].toString()),
                          );
                      },),
                    ],)
                  ),
                  if(option == 3)
                  Expanded( 
                    child: Column(children: [
                      const Text('R evaluada'),
                      ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: listeva.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: Text('$index)'),
                            title: Text(listeva[index].toString()),
                          );
                      },),
                    ],)
                  ),
                ],
              ),
            ),
          ),
          if (option == 3)
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Row(
                children: [
                  Expanded( 
                    child: Column(children: [
                      const Text('F(x)'),
                      ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: lista1.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: Text('$index)'),
                            title: Text(lista1[index].toString()),
                          );
                      },),
                    ],)
                  ),
                  Expanded( 
                    child: Column(children: [
                      const Text('Límite inferior'),
                      ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: limInf.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: Text('$index)'),
                            title: Text(limInf[index].toString()),
                          );
                      },),
                    ],)
                  ),
                  Expanded( 
                    child: Column(children: [
                      const Text('Límite superior'),
                      ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: limSup.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            title: Text(limSup[index].toString()),
                          );
                      },),
                    ],)
                  ),
                ],
              ),
            ),
          ),
      ],)
    );
  }
}