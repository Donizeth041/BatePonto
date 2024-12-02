import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:
            Text('Cadastro de Usuário', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Nome',
                labelStyle: TextStyle(color: Colors.black),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.black),
              ),
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Senha',
                labelStyle: TextStyle(color: Colors.black),
              ),
            ),
            DropdownButton<String>(
              hint: Text('Selecione o Tipo de Usuário'),
              items:
                  <String>['Administrador', 'Funcionário'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (_) {
                // Ação ao selecionar tipo de usuário
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Ação de cadastro
              },
              child: Text('Cadastrar', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
