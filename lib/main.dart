import 'package:flutter/material.dart';
import 'Telas/login.dart';
import 'Telas/register.dart';
import 'Telas/profile.dart';
import 'Telas/historico.dart';
import 'Telas/ponto.dart';
import 'Telas/pesquisa.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCQsGNTsmwifj06uEE1m7mbrU1Qf4u2STA",
      authDomain: "bate-ponto-fa7a1.firebaseapp.com",
      projectId: "bate-ponto-fa7a1",
      storageBucket: "bate-ponto-fa7a1.appspot.com",
      messagingSenderId: "821347773206",
      appId: "1:821347773206:web:87975141e0e0f2963dfe37",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bate-Ponto',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela Principal'),
        backgroundColor: Colors.blue,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.login, color: Colors.blue),
              title: Text('Login'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.person_add, color: Colors.blue),
              title: Text('Cadastrar'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.person, color: Colors.blue),
              title: Text('Perfil'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.history, color: Colors.blue),
              title: Text('Histórico'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HistoricoScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.access_time, color: Colors.blue),
              title: Text('Bater Ponto'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PontoScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.search, color: Colors.blue),
              title: Text('Pesquisar'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PesquisaScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Bem-vindo ao sistema de bate-ponto!'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Text('Login'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterScreen()),
                );
              },
              child: Text('Registrar'),
            ),
          ],
        ),
      ),
    );
  }
}
