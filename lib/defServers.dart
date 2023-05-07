import 'package:flutter/material.dart';
import 'package:random_generator/defDistri.dart';


class Servers extends StatefulWidget {
  final int option;
  final String station;
  final String station2;
  final String distLlegada;
  final Election election;
  const Servers({super.key, required this.option, required this.station, required this.station2, required this.election, required this.distLlegada});

  @override
  // ignore: library_private_types_in_public_api
  _defServers createState() => _defServers();
}
// ignore: camel_case_types, must_be_immutable
class _defServers extends State<Servers> {
  List<Widget> serversList = [];
  final List<String> items = [
    '',
    'Exponencial',
    'Uniforme',
    'Normal'
  ];
  Map<String, String> selectedValue = {};
  Map<String, String> selectedValue2 = {};
  String? selectedValue3;
  String? selectedValue4;
  @override
  void initState() {
    super.initState();
    
    selectedValue = Map.from(selectedValue);
    selectedValue2 = Map.from(selectedValue2);
    selectedValue3 = selectedValue3 ?? ''; 
    selectedValue4 = selectedValue4 ?? ''; 
  }
  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuración de Servidores'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(selectedValue3);
          print(selectedValue4);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  Distributions(selectedValue: selectedValue, selectedValue2: selectedValue2, selectedValue3: selectedValue3!, selectedValue4: selectedValue4!, station:widget.station, station2:widget.station2, election: widget.election)),
          );
        },
        tooltip: 'Siguiente',
        child: const Icon(Icons.arrow_forward_rounded),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,

        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              if(widget.election != Election.si) ...[
                Column(
                children: <Widget>[
                  const Text('Estación 1', style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                )),
                
                  for (int i = 1; i <= int.parse(widget.station); i++) ...[
                    Text('Servidor $i'),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(width: .3),
                      ),
                      child: DropdownButton<String>(
                        value: selectedValue['${widget.station}_$i'],
                        items: items.map((String option) {
                          return DropdownMenuItem<String>(
                            value: option,
                            child: Text(option),
                          );
                        }).toList(),
                        
                        onChanged: (value) {
                          setState(() {
                            selectedValue['${widget.station}_$i'] = value!;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ],
              ),
              ],
              
            if(widget.election != Election.si) ...[
              Column(
              children: <Widget>[
                const Text('Estación 2', style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                )),
                for (int i = 1; i <= int.parse(widget.station2); i++)...[
                  Text('Servidor $i'),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: .3),
                    ),
                    child: DropdownButton<String>(
                      value: selectedValue2['${widget.station2}_$i'],
                      items: items.map((String option) {
                        return DropdownMenuItem<String>(
                          value: option,
                          child: Text(option),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedValue2['${widget.station2}_$i'] = value!;
                        });
                      },
                    ),
                  ),
                const SizedBox(height: 10),
                ],
              ],
            ),
            ],

            if(widget.election == Election.si) ...[
              const Text('Estación 1', style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                )),
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
                  value: selectedValue3,
                  onChanged: (value) {
                    setState(() {
                      selectedValue3 = value!;
                    });
                  },
                ),
              ),
              const SizedBox(height: 10),
              const Text('Estación 2', style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                )),
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
                  value: selectedValue4,
                  onChanged: (value) {
                    setState(() {
                      selectedValue4 = value!;
                    });
                  },
                ),
              ),
              const SizedBox(height: 10),
            ]
          ],
        ),
        ],
      ),
    );
  }
}