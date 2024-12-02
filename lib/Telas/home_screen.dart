import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tela do Administrador")),
      body: Center(child: Text("Bem-vindo à Tela do Administrador!")),
    );
  }
}
