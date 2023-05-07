import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'defServers.dart';
import 'defDistri.dart';

class Estation extends StatefulWidget {
  const Estation({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _defEstation createState() => _defEstation();
}


// ignore: camel_case_types, must_be_immutable
class _defEstation extends State<Estation> {
  final TextEditingController _station = TextEditingController();
  final TextEditingController _station2 = TextEditingController();
  final List<String> items = [
    'Poisson',
    'Exponencial',
    'Uniforme',
    'Normal',
  ];
  // ignore: non_constant_identifier_names
  final int option = 0;
  String? selectedValue;
  Election _election = Election.si;
  
  @override
  Widget build(BuildContext context) {
    
    // ignore: no_leading_underscores_for_local_identifiers
    return Scaffold(
  
      appBar: AppBar(
        title: const Text('Configuración de Estaciones'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  Servers(option: option, station: _station.text, station2: _station2.text, election: _election, distLlegada: selectedValue!)),
          );
        },
        tooltip: 'Siguiente',
        child: const Icon(Icons.arrow_forward_rounded),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          
          Expanded(
            child: Column(
              children: <Widget>[
                const Text('\n\nDistribución de las llegadas \n'),
                Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(width: .3),
                      ),
                      child: DropdownButton<String>(
                        items: items.map((String option) {
                          return DropdownMenuItem<String>(
                            value: option,
                            child: Text(option),
                          );
                        }).toList(),
                        value: selectedValue,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value!;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
                Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          const Text('\n\nCuantos servidores tiene la estación 1: \n'),
                          SizedBox(
                          width: 100.0,
                          child: Align(
                            alignment: const Alignment(0.3, -0.8),
                            child: TextField(
                              controller: _station,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Estación 1',
                              ),
                            ),
                          ), 
                        ),
                    ],)),
                    Expanded(
                    child: Column(
                      children: <Widget>[
                        const Text('\n\nCuantos servidores tiene la estación 2: \n'),
                        SizedBox(
                        width: 100.0,
                        child: Align(
                          alignment: const Alignment(0.3, -0.8),
                          child: TextField(
                            controller: _station2,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Estación 2',
                            ),
                          ),
                        ), 
                      ),
                  ],))
                ],)),
                Expanded(child: Column(
                  children: <Widget>[
                    const Text('¿Los servidores tendrán la misma distribución?'),
                    ListTile(
                      title: const Text('Si'),
                      leading: Radio<Election>(
                        value: Election.si,
                        groupValue: _election,
                        onChanged: (Election? value) {
                          setState(() {
                            _election = value!;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('No'),
                      leading: Radio<Election>(
                        value: Election.no,
                        groupValue: _election,
                        onChanged: (Election? value) {
                          setState(() {
                            _election = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
  
}
