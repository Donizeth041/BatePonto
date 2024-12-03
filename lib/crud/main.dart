import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../telas/home_screen.dart';
import '../telas/funcionario_home.dart';
import '../telas/menu_adm.dart';
import '../telas/perfil_page.dart';
import '../telas/bater_ponto_page.dart';
import '../telas/historico_page.dart';
import '../telas/register_user_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bate Ponto',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomeScreen(),
        '/funcionario_home': (context) => FuncionarioHome(),
        '/menu_adm': (context) => MenuAdm(),
        '/perfil': (context) => PerfilPage(),
        '/bater_ponto': (context) => BaterPontoPage(),
        '/historico': (context) => HistoricoPage(),
        '/logout': (context) => LogoutPage(),
        '/register_user': (context) => RegisterUserPage(),
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // Verifica o tipo de usuário e navega para a página correta
      User? user = userCredential.user;
      if (user != null) {
        if (user.email == 'admin@empresa.com') {
          Navigator.pushReplacementNamed(
              context, '/menu_adm'); // Corrigido para '/menu_adm'
        } else {
          Navigator.pushReplacementNamed(context,
              '/funcionario_home'); // Corrigido para '/funcionario_home'
        }
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Senha'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: login,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class LogoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Logout')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Você foi deslogado.'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(
                    context, '/'); // A volta para o login
              },
              child: Text('Voltar para Login'),
            ),
          ],
        ),
      ),
    );
  }
}
