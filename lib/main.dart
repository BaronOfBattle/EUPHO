import 'package:flutter/material.dart';
import 'package:kkkk/register_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Movie App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.black, // Defina a cor de fundo da tela
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.white), // Defina a cor do texto
          bodyText2: TextStyle(color: Colors.white), // Outro estilo de texto, se necessário
          // Adicione mais estilos de texto conforme necessário
        ),
      ),
      home: RegisterScreen(),
    );
  }
}
