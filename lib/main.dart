import 'package:flutter/material.dart';
import './componets/form.dart';  

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Creacion de usuario',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Creacion de usuario'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: RegistroFormulario(),  // Utiliza el componente del formulario
        ),
      ),
    );
  }
}
