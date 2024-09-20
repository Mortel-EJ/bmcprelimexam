import 'package:flutter/material.dart';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}
class MyAppState extends State<MyApp> {
  String? _startMeasure;
  final List<String> _measures = [ 'meters',
    'kilometers', 'grams', 'kilograms', 'feet',
    'miles', 'pounds (lbs)', 'ounces',
  ];
  double _numberFrom=0;
  @override
  void initState() {
    _numberFrom = 0; super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle inputStyle = TextStyle(
      fontSize: 20,
      color: Colors.blue[900],
    );
    final TextStyle labelStyle = TextStyle(
      fontSize: 24,
      color: Colors.grey[700],
    );
    return MaterialApp(
      title: 'Measures Converter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Measures Converter'),
        ),

        body: Center(
          child: Column(
            children: [DropdownButton(
              items: _measures.map((String value) {
                return DropdownMenuItem<String>(value: value, child: Text(value),);
              }).toList(),
              onChanged: (value) { setState(() {
                _startMeasure = value;
              });
              },
              value: _startMeasure,

            ),
              TextField(
                onChanged: (text) {
                  var rv = double.tryParse(text); if (rv != null) {
                    setState(() {
                      _numberFrom = rv;
                    });
                  }
                },

              ),Text((_numberFrom == null) ? '' : _numberFrom.toString())
            ],
          ),
        ),
      ),
    );
  }
}
