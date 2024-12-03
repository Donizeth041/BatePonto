import 'package:flutter/material.dart';
import 'perfil_page.dart';
import 'ponto_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FuncionarioPage extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página do Funcionário'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Perfil'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => PerfilPage()),
              );
            },
          ),
          ListTile(
            title: Text('Bater Ponto'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => PontoPage()),
              );
            },
          ),
          ListTile(
            title: Text('Logout'),
            onTap: () async {
              await _auth.signOut();
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }
}
