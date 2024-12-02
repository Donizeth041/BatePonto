import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';  // Para onde o usuário será redirecionado após o login
import 'funcionario_home.dart';  // Para o funcionário

Future<void> login(String email, String senha) async {
  try {
    // Realiza a autenticação do usuário
    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: senha,
    );

    // Obtém a referência do Firestore para a coleção de usuários
    DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('usuarios').doc(userCredential.user!.uid).get();
    
    // Verifica o tipo de usuário
    String tipoUsuario = userDoc['tipo'];  // 'admin' ou 'funcionario'

    // Redireciona com base no tipo de usuário
    if (tipoUsuario == 'admin') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()), // Tela do admin
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => FuncionarioHome()), // Tela do funcionário
      );
    }
  } catch (e) {
    print('Erro no login: $e');
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Senha'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
