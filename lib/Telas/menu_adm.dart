import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MenuAdm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Administrador'),
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
                'Administrador',
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
              leading: Icon(Icons.add),
              title: Text('Cadastrar Usuários'),
              onTap: () {
                Navigator.pushNamed(context, '/cadastrarUsuarios');
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
              leading: Icon(Icons.search),
              title: Text('Pesquisar Pontos'),
              onTap: () {
                Navigator.pushNamed(context, '/pesquisarPontos');
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
        child: Text('Bem-vindo, Administrador!'),
      ),
    );
  }
}
