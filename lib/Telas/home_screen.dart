import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página Inicial'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bem-vindo à página inicial!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Aqui você pode adicionar a navegação para outras telas, como o menu do funcionário
                Navigator.pushNamed(context, '/funcionario_home');
              },
              child: Text('Ir para Home Funcionário'),
            ),
            ElevatedButton(
              onPressed: () {
                // Aqui você pode adicionar a navegação para o menu do administrador
                Navigator.pushNamed(context, '/menu_adm');
              },
              child: Text('Ir para Menu Administrador'),
            ),
          ],
        ),
      ),
    );
  }
}
