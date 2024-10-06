import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
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
            decoration: InputDecoration(labelText: 'Contraseña'),
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingresa una contraseña';
              }
              return null;
            },
            onSaved: (value) {
              _password = value ?? '';
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
