import 'package:flutter/material.dart';

class PesquisaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Pesquisar Pontos', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Pesquisar Nome',
                labelStyle: TextStyle(color: Colors.black),
              ),
              onChanged: (value) {
                // Lógica de busca
              },
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  title: Text('Nome: João Silva',
                      style: TextStyle(color: Colors.black)),
                  subtitle: Text('Último Ponto: 2024-10-01 17:00',
                      style: TextStyle(color: Colors.black)),
                ),
                ListTile(
                  title: Text('Nome: Maria Souza',
                      style: TextStyle(color: Colors.black)),
                  subtitle: Text('Último Ponto: 2024-10-02 16:45',
                      style: TextStyle(color: Colors.black)),
                ),
                // Adicione mais funcionários aqui
              ],
            ),
          ),
        ],
      ),
    );
  }
}
