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

class Kolmogorov {
  final double Dn;
  final double dn;
  final String message;
  final List<double> sort_list;
  Kolmogorov(this.Dn, this.dn, this.message, this.sort_list);
}

Kolmogorov kolmogorov (List<double> lista){
  List <double> sort_list = lista;
  var Fn = <double>[];
  var F = <double>[];
  String message;
  sort_list.sort();
  for (int i = 0;  i  <= sort_list.length; i++){
    Fn.add((i+1)/sort_list.length);
  }
  for (int i = 0;  i  < sort_list.length; i++){
    F.add(Fn[i] - sort_list[i]);
  }
  double exact_value = 0;
  double Dn = F.reduce((a, b) => a>b ? a:b);
  print(Dn);
  double dn = 1.36/sqrt(sort_list.length);
  print(dn);

  if (dn < exact_value){
    message = ('los números siguen una función de distribución uniforme');
  }
  else{
    message = ('los números no siguen una función de distribución uniforme');  
  }
  return(Kolmogorov(Dn, dn, message, sort_list));
}

class Poker {
  List<double> listaP ;
  

  Poker(this.listaP);
}

Poker poker (List<int> lista){
  List <int> list = lista; //Lista de números pseudoaleatorios
  List<String> digitos = [], lista_str = []; //Para almacenar los digitos del número
  List<int> digInt = [], fo = []; //Digitos en int
  List<double> prueba = [], fe = [], x2 = []; //Valores obtenidos de la prueba
  List<double> probabilidad = [0.0001, 0.0045, 0.009, 0.072, 0.108, 0.504, 0.3024];
  int a1 = 0, a2 = 0, t = 0, m1 = 0;
  double x2Sum;

  for(int i=0; i < 7; i++){ 
    fo.add(0);
  }


  for (var numero in list) {
    String lista = numero.toString();
    String fiveDigitsStr = lista.substring(0, 5);
    lista_str.add(fiveDigitsStr);
  }
  

  //Ciclo para analizar cada uno de los números pseudoaleatorios
  for(int r=0; r < lista_str.length; r++){ 
    digitos = lista_str[r].split("");

    digInt = digitos.map((str) => int.parse(str)).toList();

    for(int g = 0; g < digInt.length - 1; g++){
      for(int c = g+1; c < digInt.length ; c++){
        if(digInt[g] == digInt[c]){
          if(a1 == 0){a1++; m1 = digInt[g];}
          else if(a1 > 0 && digInt[g] == m1){a1++;}
          else if (a1 > 0 && digInt[g] != m1){a2++;}
        } 
        if(t == 4){
          if(a1 == 10){ g = digInt.length; a1 = 5;} 
          else if(a1 == 6){ g = digInt.length; a1 = 4;}
          else {t = c + 1;}
        }else{ t++;}
      }    
    }

  //Ver si son todos los números diferentes, 1 par, 2 pares, 1 full, 1 tercia, 1 poker o 1 quintilla
    switch(a1){  
      case 0: { fo[6] += 1; break;}
      case 1: { if(a2 == 0){ fo[5] += 1;} else if(a2 == 1){ fo[4] += 1;} else{ fo[2] += 1;} break;}  
      case 3: { if(a2 == 0){ fo[3] += 1;} else{ fo[2] += 1;} break;}
      case 4: { fo[1] += 1; break;}
      case 5: { fo[0] += 1; break;}
    }
    print(fo);
  }
  
  for(int i=0; i < 6; i++){ 
    fe.add(lista_str.length * probabilidad[i]);
  }
  for(int i=0; i < 6; i++){ 
    x2.add(pow(fo[i]-fe[i], 2)/fe[i]);
  }
  x2Sum = x2.reduce((a, b) => a + b);
  return Poker(prueba);
}
int coefBinomial(int n, int k) {
  if (k < 0 || k > n) {
    return 0;
  }

  int resultado = 1;
  for (int i = 1; i <= k; i++) {
    resultado *= (n - i + 1);
    resultado ~/= i;
  }

  return resultado;
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
    var lista0, listpoker = <double>[];
    var sort_list = <double>[];

    for (final row in data) {
      print(row);
      lista.add(row);
    }
    int mayor = lista.reduce((a, b) => a>b ? a:b);
    lista0 = lista.map((elemento) => elemento / (mayor + 1)).toList();
    double promedio = 0, Z0, Z, X0 = 0, p_value = 0, Dn= 0, dn = 0;
    String mensaje = '';
    promedio = statistics_prom(lista0, data);
    Z = ((promedio - 0.5)*sqrt(lista.length))/sqrt(1/12);
    Z0 = Z.abs();
    if(option == 2){
      var met_inter= statistics_inter(lista0, interval);
      // ignore: non_constant_identifier_names
      X0 = met_inter.x0;
      p_value = met_inter.exact_pvalue;
      mensaje = met_inter.message;
    }
    if(option == 3){
      var kolm_smirnov = kolmogorov(lista0);
      Dn = kolm_smirnov.Dn;
      dn = kolm_smirnov.dn;
      mensaje = kolm_smirnov.message;
      sort_list = kolm_smirnov.sort_list;
    }
    if(option == 4){
      var _poker = poker(lista);
      listpoker = _poker.listaP;
    }
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
            child: Text('\n\n $mensaje ya que X_0 es $X0 y el valor de chi cuadrado para ese intervalo es $p_value'),
          ),
          if (option == 3)
          Text('\n\n Dn es $Dn dn es de $dn el valor de la tabla para estos datos $mensaje'),
          if (option == 3)
          Expanded(
            child: SingleChildScrollView(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
              itemCount: lista.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(sort_list[index].toString()),
                );
              },),
            ),
          ),
          if (option == 4)
          Expanded(
            child: SingleChildScrollView(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
              itemCount: lista.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(listpoker[index].toString()),
                );
              },),
            ),
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