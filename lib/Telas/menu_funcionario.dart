import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MenuFuncionario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Funcionário'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Funcionário',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Editar Perfil'),
              onTap: () {
                Navigator.pushNamed(context, '/editarPerfil');
              },
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: Text('Ver Histórico'),
              onTap: () {
                Navigator.pushNamed(context, '/verHistorico');
              },
            ),
            ListTile(
              leading: Icon(Icons.punch_clock),
              title: Text('Bater Ponto'),
              onTap: () {
                Navigator.pushNamed(context, '/baterPonto');
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushReplacementNamed(context, '/logout');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Bem-vindo, Funcionário!'),
      ),
    );
  }
}
