import 'dart:math';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:random_generator/resutlsnoUniform.dart';
import 'numbers.dart';


class DecimalTextInputFormatter extends TextInputFormatter {
  DecimalTextInputFormatter({this.decimalRange}) : assert(decimalRange == null || decimalRange > 0);

  final int? decimalRange;

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    TextSelection newSelection = newValue.selection;
    String truncated = newValue.text;

    if (decimalRange != null) {
      String value = newValue.text;

      if (value.contains(".")) {
        List<String> split = value.split(".");
        if (split.length == 2 && split.last.length > decimalRange!) {
          truncated = "${split.first}.${split.last.substring(0, decimalRange)}";
        }
      }
    }

    return TextEditingValue(
      text: truncated,
      selection: TextSelection.collapsed(offset: newSelection.extentOffset),
    );
  }
}
// ignore: camel_case_types
class vbleNoUn extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();

  final int option;
  vbleNoUn({super.key, required this.option});
  @override
  Widget build(BuildContext context) {
    
    // ignore: no_leading_underscores_for_local_identifiers
    return Scaffold(
  
      appBar: AppBar(
        title: const Text('Generador'),
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: () { 
          
          double media = double.tryParse(_controller.text) ?? 0;
          int a = int.tryParse(_controller2.text) ?? 0;
          int b = int.tryParse(_controller3.text) ?? 0;
          double lambda = double.tryParse(_controller4.text) ?? 0;
          

          Navigator.push(
            context,  
            MaterialPageRoute(builder: (context) =>  resultsnoUNiform(option: option, media:media, a:a, b:b, lambda: lambda)),
          );
        },
        tooltip: 'Generar',
        child: const Icon(Icons.arrow_forward_rounded),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          if (option == 1) 
          SizedBox(
            width: 100.0,
            child: Align(
              alignment: const Alignment(0.3, -0.8),
              child: TextFormField(
                controller: _controller,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
                  DecimalTextInputFormatter(decimalRange: 2),
                ],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Media exponencial',
                ),
              ),
            ), 
          ),
          if (option == 2) 
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
          if (option == 2) 
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
                  hintText: 'b',
                ),
              ),
            ),
          ),
          if (option == 3) 
          SizedBox(
            width: 100.0,
            child: Align(
              alignment: const Alignment(0.3, -0.8),
              child: TextField(
                controller: _controller4,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: <TextInputFormatter>[
                   FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
                   DecimalTextInputFormatter(decimalRange: 2),
                 ],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'λ',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}