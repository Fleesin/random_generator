import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'defDistri.dart';
import 'dart:io';
import 'package:excel/excel.dart';
import 'resutlsnoUniform.dart';
import 'dart:math';
import 'dart:collection';

class Fifo{
  List<double> espera;
  List<double> listTotal;
  Fifo(this.espera, this.listTotal);
}



Fifo fifo(List<int> llegadas, List<double> tiempos, int suma, int station, int _station2){
  List<double> espera = [];
  List<int> client = [];
  List<int> time = [];
  List<double> atencion = [];
  List<double> result = [];
  List<int> servidores = [];
  List<int> cola = [];
  List<int> newtime = tiempos.map((numero) => numero.truncate()).toList();
  List<double> resultado = [];
  for (int i = 0; i < tiempos.length; i++) {
    double resta = tiempos[i] - newtime[i];
    resultado.add(resta);
  }
  time.add(0);
  print(newtime);
  for(int i = 0; i < station; i++){
    servidores.add(0);
  }
  print(servidores);
  int j = 0;
  for(int i = 0; i<llegadas.length ;i++){
    if(llegadas[i] != 0){
      client.add(i+1);
      if(client.length > 1){
        int count = 0;
        while(llegadas[i] > count){
          int diff = client[client.length-1] - client[client.length-2];
          time.add(diff);
          count++;
        }
      }
    }
  }


  print('$time');

  result = espera.asMap().entries.map((e) => e.value + tiempos[e.key]).toList();
  return(Fifo(espera, result));
}
class apliResults extends StatefulWidget {
  final String controller;
  final String controller2;
  final String controller3;
  final String controller4;
  final String controller5;
  final String controller6;
  final String controllerhoras;
  final String controllerllegada;
  final String selectedValue;
  final String selectedValue2;
  final String station;
  final String station2;
  final Election election;
  const apliResults({super.key, required this.station, required this.station2, required this.election, required this.controller, required this.controller2, required this.controller3, required this.controller4, required this.controller5, required this.controller6, required this.controllerllegada, required this.controllerhoras, required this.selectedValue, required this.selectedValue2});
  
  @override
  // ignore: library_private_types_in_public_api
  _apliResults createState() => _apliResults();
}

// ignore: camel_case_types, must_be_immutable
class _apliResults extends State<apliResults> {
  List<Widget> serversList = [];
  final List<String> items = [
    '',
    'Exponencial',
    'Uniforme',
    'Normal'
  ];

  
  @override
  Widget build(BuildContext context) {
    final bytes = File('Archivos/numeros.xlsx').readAsBytesSync();
    final excel = Excel.decodeBytes(bytes);
    final hoja = excel.tables['Sheet1'];
    final data = hoja?.rows.map((row) => row[0]?.value).where((valor) => valor is num).toList() ?? [];
    final lista = <int>[];
    final sublist = <int>[];
    var limSup = <double>[];
    var lista2 = <double>[];
    var lista1 = <double>[];
    var lista0 = <double>[];
    var listareduced= <double>[];
    List<double> selectedList = [];
    List<double> selectedList2 = [];
    var listeva = <int>[];
    double media, lambda;
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
    print(widget.controllerllegada);
    int mayor = lista.reduce((a, b) => a>b ? a:b);
    lista0 = lista.map((elemento) => elemento / (mayor + 1)).toList();
    lambda = double.parse(widget.controllerllegada);
    int horas = int.parse(widget.controllerhoras) * 60;
    int a,b;
    
    List<double> testlist = [0.001964636542, 0.1787819253, 0.1316306483, 0.5442043222, 0.4341846758, 0.3968565815, 0.4734774067, 0.05304518664, 0.231827112, 0.9174852652, 0.6679764244, 0.6011787819, 0.6856581532, 0.1964636542, 0.7269155206, 0.5854616896, 0.8231827112, 0.4931237721, 0.3811394892, 0.6110019646, 0.3497053045, 0.8860510806, 0.9430255403, 0.1944990177, 0.9941060904, 0.2475442043];

    listareduced = lista0.take(horas).toList();
    var met_poisson = poisson(listareduced, lambda);
    listeva = met_poisson.listeva;
    int suma = met_poisson.listeva.reduce((a, b) => a + b);
    print(suma);

    List<double> shuffledList = lista0.toList()..shuffle();
    List<double> shuffledList2 = lista0.toList()..shuffle();

    int station = int.parse(widget.station);
    int station2 = int.parse(widget.station2);


    for (int i = 0; i < suma; i++) {
      selectedList.add(shuffledList[i]);
    }
    for (int i = 0; i < suma; i++) {
      selectedList2.add(shuffledList[i]);
    }



    if(widget.selectedValue == 'Exponencial'){
      media = double.parse(widget.controller);
      lista1 = exponencial(testlist, media);
      print(lista1);
    }
    if(widget.selectedValue == 'Uniforme'){
      a = int.parse(widget.controller2);
      b = int.parse(widget.controller3);
      lista1 = uniforme(selectedList, a, b);
      print(lista1);
    }
   
    if(widget.selectedValue2 == 'Exponencial'){
      media = double.parse(widget.controller4);
      lista2 = exponencial(selectedList2, media);
      print(lista2);
    }
    if(widget.selectedValue2 == 'Uniforme'){
      a = int.parse(widget.controller5);
      b = int.parse(widget.controller6);
      lista2 = uniforme(selectedList2, a, b);
      
    }

    var result = fifo(listeva, lista1, suma, station, station2);
    
    print(result.espera);
    print(result.listTotal);
    // ignore: no_leading_underscores_for_local_identifiers
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuración de Servidores'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        }
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded( 
            child: SingleChildScrollView(
              child: Column(children: [
                const Text('R evaluada'),
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: listeva.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Text('${index+1})'),
                      title: Text(listeva[index].toString()),
                    );
                },),
              ],)
            ),
          ),
        ],
      ),
    );
  }
}