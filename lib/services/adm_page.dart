import 'package:flutter/material.dart';
import '../Telas/perfil_page.dart';
import '../Telas/register_user_page.dart';
import '../Telas/ponto_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AdmPage extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página do Administrador'),
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
            title: Text('Cadastrar Usuário'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => RegisterUserPage()),
              );
            },
          ),
          ListTile(
            title: Text('Ver Ponto dos Funcionários'),
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
