
import 'package:flutter/material.dart';

class OpcionesSelector extends StatefulWidget {
  final List<String> opciones; // Lista de opciones a mostrar
  final Function(String) onSeleccionado; // Función callback para obtener la opción seleccionada

  OpcionesSelector({required this.opciones, required this.onSeleccionado});

  @override
  _OpcionesSelectorState createState() => _OpcionesSelectorState();
}

class _OpcionesSelectorState extends State<OpcionesSelector> {
  String? _opcionSeleccionada; // Almacena la opción seleccionada

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true, // Para ajustar el tamaño al contenido
      itemCount: widget.opciones.length,
      itemBuilder: (context, index) {
        return RadioListTile<String>(
          title: Text(widget.opciones[index]),
          value: widget.opciones[index],
          groupValue: _opcionSeleccionada,
          onChanged: (String? value) {
            setState(() {
              _opcionSeleccionada = value;
            });
            widget.onSeleccionado(value!); // Llamamos al callback con la opción seleccionada
          },
        );
      },
    );
  }
}