import 'package:flutter/material.dart';

class FuncionarioHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home do Funcionário'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Bem-vindo ao sistema de ponto
            Text(
              'Bem-vindo ao Sistema de Ponto!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            // Seção de perfil do funcionário (aqui você pode adicionar mais detalhes do perfil)
            Text(
              'Nome: João Silva',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Cargo: Funcionário',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),

            // Botão para Bater o Ponto
            ElevatedButton(
              onPressed: () {
                // Ação de bater o ponto (imagine que você tem uma função para isso)
                // Por exemplo, chamar um método para salvar o ponto no Firebase.
                print("Ponto batido!");
              },
              child: Text('Bater Ponto'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, // Cor do botão
                onPrimary: Colors.white, // Cor do texto
              ),
            ),
            SizedBox(height: 20),

            // Botão de Logout
            ElevatedButton(
              onPressed: () {
                // Lógica para logout
                Navigator.pushReplacementNamed(context, '/logout');
              },
              child: Text('Logout'),
              style: ElevatedButton.styleFrom(
                primary: Colors.red, // Cor do botão de logout
                onPrimary: Colors.white, // Cor do texto
              ),
            ),
          ],
        ),
      ),
    );
  }
}
