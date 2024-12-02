import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Perfil do Usuário', style: TextStyle(color: Colors.black)),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nome: Usuário Exemplo',
                style: TextStyle(color: Colors.black, fontSize: 18)),
            SizedBox(height: 10),
            Text('Email: exemplo@email.com',
                style: TextStyle(color: Colors.black, fontSize: 18)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Ação para editar perfil
              },
              child:
                  Text('Editar Perfil', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
