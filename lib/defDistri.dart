import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:random_generator/apliResult.dart';
import 'vbleNoUniform.dart';
enum Election { si, no }

class Distributions extends StatefulWidget {
  final Map<String, String> selectedValue;
  final Map<String, String> selectedValue2;
  final String selectedValue3;
  final String selectedValue4;
  final String station;
  final String station2;
  final Election election;
  Distributions({super.key, required this.selectedValue, required this.selectedValue2, required this.selectedValue3, required this.selectedValue4, required this.station, required this.station2, required this.election});
  
  @override
  // ignore: library_private_types_in_public_api
  _defDistri createState() => _defDistri();
}

// ignore: camel_case_types, must_be_immutable
class _defDistri extends State<Distributions> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  final TextEditingController _controller5 = TextEditingController();
  final TextEditingController _controller6 = TextEditingController();
  final TextEditingController _controllerllegada = TextEditingController();
  final TextEditingController _controllerhoras = TextEditingController();
  
  List<Widget> serversList = [];
  final List<String> items = [
    '',
    'Exponencial',
    'Uniforme',
    'Normal'
  ];


  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuración de Servidores'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  apliResults(station: widget.station, station2: widget.station2, controller: _controller.text, controller2: _controller2.text, controller3: _controller3.text, controller4: _controller4.text, controller5: _controller5.text, controller6: _controller6.text, election: widget.election, controllerllegada: _controllerllegada.text, controllerhoras: _controllerhoras.text, selectedValue: widget.selectedValue3, selectedValue2: widget.selectedValue4,)),
          );
        },
        tooltip: 'Siguiente',
        child: const Icon(Icons.arrow_forward_rounded),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Llegada', style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              )),
              SizedBox(
                width: 100.0,
                child: Align(
                  alignment: const Alignment(0.3, -0.8),
                  child: TextField(
                    controller: _controllerllegada,
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
              const Text('Horas', style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              )),
              SizedBox(
                width: 100.0,
                child: Align(
                  alignment: const Alignment(0.3, -0.8),
                  child: TextField(
                    controller: _controllerhoras,
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
                        DecimalTextInputFormatter(decimalRange: 2),
                      ],
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Horas',
                    ),
                  ),
                ),
              ),
            ],
          ),
          
          if(widget.election == Election.no)...[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                for(int i = 0; i<widget.selectedValue.length; i++)...[
                  if(widget.selectedValue.values.elementAt(i) == 'Exponencial')...[
                    Text('Servidor ${i+1}', style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      )),
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
                            hintText: 'Media exponencial',
                          ),
                        ),
                      ), 
                    ),
                  ],
                  if(widget.selectedValue.values.elementAt(i) == 'Uniforme')...[
                    Text('Servidor ${i+1}', style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      )),
                    Row(
                      children: <Widget>[
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
                                hintText: 'a',
                              ),
                            ),
                          ),
                        ),
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
                    ],)
                  ],
                  if(widget.selectedValue.values.elementAt(i) == 'Normal')...[
                    const Text('Hola soy normal')
                  ],
                ],
              ],
            ),
            
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                for(int i = 0; i<widget.selectedValue2.length; i++)...[
                  if(widget.selectedValue2.values.elementAt(i) == 'Exponencial')...[
                    Text('Servidor ${i+1}', style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      )),
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
                            hintText: 'Media exponencial',
                          ),
                        ),
                      ), 
                    ),
                  ],
                  if(widget.selectedValue2.values.elementAt(i) == 'Uniforme')...[
                    Text('Servidor ${i+1}', style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      )),
                    Row(
                      children: <Widget>[
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
                    ],)
                  ],
                  if(widget.selectedValue2.values.elementAt(i) == 'Normal')...[
                    const Text('Hola soy normal')
                  ],
                ],
              ],
            ),
          ],
          
          if(widget.selectedValue3 == 'Exponencial')...[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Estación 1', style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                )),
                SizedBox(
                  width: 100.0,
                  child: Align(
                    alignment: const Alignment(0.3, -0.8),
                    child: TextFormField(
                      controller: _controller,
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: <TextInputFormatter>[
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
              ],
            ),     
          ],
          if(widget.selectedValue3 == 'Uniforme')...[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Estación 1', style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )),
                Row(
                  children: <Widget>[
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
                ],)
              ],
            ),     
          ],
          if(widget.selectedValue4 == 'Exponencial')...[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Estación 2', style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )),
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
                        hintText: 'Media exponencial',
                      ),
                    ),
                  ), 
                ),
              ],
            ), 
          ],
          
          if(widget.selectedValue4 == 'Uniforme')...[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Estación 2', style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )),
                Row(
                  children: <Widget>[
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
                            hintText: 'a',
                          ),
                        ),
                      ),
                    ),
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
                ],)
              ],
            ),     
          ],
        ],
      ),
    );
  }
}