import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:excel/excel.dart';


// ignore: must_be_immutable, camel_case_types

class Resultado{
  final double x0;
  final double exact_pvalue;
  final String message;
  Resultado(this.x0, this.exact_pvalue, this.message);
}
Resultado statistics_inter(List<double> lista, intervals) {
  final intervalo = 1/intervals;
  final groups = List.generate(
      (1 / intervalo).ceil(),
      (index) => lista
          .where((lista) => lista >= index * intervalo && lista < (index + 1) * intervalo)
          .toList()); // agrupar según el intervalo
  print(groups);

  List <int> counter = groups.map((groups) => groups.length).toList();
  List <double> p_value = [3.8415, 5.9915, 7.8147, 9.4877, 11.0705, 12.5916, 14.0671, 15.5073, 16.9190, 18.3070, 19.6752, 1.0261, 22.3620, 23.6848, 24.9958, 26.2962, 27.5871, 28.8693, 30.1435, 31.4104, 32.6706, 33.9245, 35.1725,  36.4150, 37.6525, 38.8851, 40.1133, 41.3372, 42.5569, 43.7730, 44.9853, 46.1942, 47.3999, 48.6024, 49.8018, 50.9985, 52.1923, 53.3835, 54.5722, 55.7585];
  double FE = lista.length/intervals;
  var lista_ = counter.map((elemento) => pow(elemento - FE, 2)/FE).toList();
  double X_0 = lista_.reduce((value, element) => value + element);
  double exact_pvalue = p_value[intervals - 2];
  String message;

  if (X_0 < exact_pvalue){
    message = ('No se pueden rechazar que los números siguen una función de distribución uniforme');
    
  }
  else{
    message = ('Los números no siguen una función de distribución uniforme');
    
  }
  return Resultado(X_0, exact_pvalue, message);
}
double statistics_prom (List<double> lista, data){
  double promedio, Z;
  final suma = lista.reduce((valorAcumulado, elemento) => valorAcumulado + elemento);
  promedio = suma / lista.length;
  print(promedio);
  return (promedio);
}

class results extends StatelessWidget {
  final int option, interval;
  const results({super.key, required this.option, required this.interval});
  
  
  @override
  Widget build(BuildContext context) {
    // Cargar datos desde un archivo de Excel
    final bytes = File('Archivos/numeros.xlsx').readAsBytesSync();
    final excel = Excel.decodeBytes(bytes);
    final hoja = excel.tables['Sheet1'];
    final data = hoja?.rows.map((row) => row[0]?.value).where((valor) => valor is num).toList() ?? [];
    final lista = <int>[];
    var lista0 = <double>[];
    for (final row in data) {
      print(row);
      lista.add(row);
    }
    int mayor = lista.reduce((a, b) => a>b ? a:b);
    lista0 = lista.map((elemento) => elemento / (mayor + 1)).toList();
    double promedio, Z0, Z, X0, p_value;
    String mensaje;
    promedio = statistics_prom(lista0, data);
    Z = ((promedio - 0.5)*sqrt(lista.length))/sqrt(1/12);
    var met_inter= statistics_inter(lista0, interval);
    // ignore: non_constant_identifier_names
    Z0 = Z.abs();

    X0 = met_inter.x0;
    p_value = met_inter.exact_pvalue;
    mensaje = met_inter.message;


    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultados estadísticos'),
      ),
      body: Column(
        children: <Widget> [
          if (option == 1)
          Text('\n\n El promedio es de $promedio \n \n El |Z_0| es de $Z0'),
          if (option == 2)
          Center(
            child: Text('$mensaje ya que X_0 es $X0 y el valor de chi cuadrado para ese intervalo es $p_value'),
          ),
          if(option == option)
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
          ),
      ],)
    );
  }
}