import 'package:flutter/material.dart';

class DropdownSelector extends StatefulWidget {
  final List<String> opciones; 
  DropdownSelector({required this.opciones});

  @override
  _DropdownSelectorState createState() => _DropdownSelectorState();
}

class _DropdownSelectorState extends State<DropdownSelector> {
  String? _opcionSeleccionada; 
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      hint: Text('Selecciona tipo de usuario'),
      value: _opcionSeleccionada, 
      icon: Icon(Icons.arrow_downward),
      onChanged: (String? nuevaOpcion) {
        setState(() {
          _opcionSeleccionada = nuevaOpcion; // Actualiza la opción seleccionada
        });
      },
      items: widget.opciones.map<DropdownMenuItem<String>>((String opcion) {
        return DropdownMenuItem<String>(
          value: opcion,
          child: Text(opcion),
        );
      }).toList(), // Genera las opciones del dropdown
    );
  }
}
