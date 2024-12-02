import 'package:flutter/material.dart';

class HistoricoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:
            Text('Histórico de Pontos', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Entrada: 2024-10-01 08:00',
                style: TextStyle(color: Colors.black)),
            subtitle: Text('Saída: 2024-10-01 17:00',
                style: TextStyle(color: Colors.black)),
          ),
          ListTile(
            title: Text('Entrada: 2024-10-02 08:15',
                style: TextStyle(color: Colors.black)),
            subtitle: Text('Saída: 2024-10-02 16:45',
                style: TextStyle(color: Colors.black)),
          ),
          // Adicione mais registros de ponto aqui
        ],
      ),
    );
  }
}
