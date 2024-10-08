import 'package:flutter/material.dart';
import './dropdown_selector.dart';

class RegistroFormulario extends StatefulWidget {
  @override
  _RegistroFormularioState createState() => _RegistroFormularioState();
}

class _RegistroFormularioState extends State<RegistroFormulario> {
  final _formKey = GlobalKey<FormState>();

  String _nombre = '';
  String _email = '';
  String _password = '';
  String _cargo = '';
  String _opcionSeleccionada = '';
  DateTime? _fechaNacimiento;
  
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
            Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity, // Esto hace que ocupe todo el ancho
                  child:  DropdownSelector(
                       opciones: ['Administrador','Cliente','Reaccion'],
                   ),
                ),
              ],
            ),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Nombre'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingresa tu nombre';
              }
              return null;
            },
            onSaved: (value) {
              _nombre = value ?? '';
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Cargo'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingresa tu nombre';
              }
              return null;
            },
            onSaved: (value) {
              _cargo = value ?? '';
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Correo Electrónico'),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingresa tu correo electrónico';
              }
              return null;
            },
            onSaved: (value) {
              _email = value ?? '';
            },
          ),
           TextFormField(
            readOnly: true, // Esto evita que el usuario escriba en el campo
            decoration: InputDecoration(
              labelText: 'Fecha de Nacimiento',
              hintText: _fechaNacimiento != null 
                  ? '${_fechaNacimiento!.day}/${_fechaNacimiento!.month}/${_fechaNacimiento!.year}' 
                  : 'Agrega Fecha',
            ),
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime(2000), // Fecha inicial por defecto
                firstDate: DateTime(1900), // Fecha mínima
                lastDate: DateTime.now(), // Fecha máxima es hoy
              );
              if (pickedDate != null) {
                setState(() {
                  _fechaNacimiento = pickedDate;
                });
              }
            },
            validator: (value) {
              if (_fechaNacimiento == null) {
                return 'Por favor selecciona tu fecha de nacimiento';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Formulario enviado')),
                );
              }
            },
            child: Text('Crear'),
          ),
        ],
      ),
    );
  }
}
