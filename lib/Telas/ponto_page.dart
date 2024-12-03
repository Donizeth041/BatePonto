import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PontoPage extends StatefulWidget {
  @override
  _PontoPageState createState() => _PontoPageState();
}

class _PontoPageState extends State<PontoPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String _currentUserId = '';
  bool _isAdmin = false;

  @override
  void initState() {
    super.initState();
    _currentUserId = _auth.currentUser!.uid;
    _checkUserType();
  }

  _checkUserType() async {
    DocumentSnapshot userDoc =
        await _firestore.collection('users').doc(_currentUserId).get();
    if (userDoc.exists) {
      setState(() {
        _isAdmin = userDoc['userType'] == 'Admin';
      });
    }
  }

  _registrarPonto() async {
    try {
      // Registrando o ponto do usuário
      await _firestore.collection('pontos').add({
        'userId': _currentUserId,
        'timestamp': Timestamp.now(),
        'userType': _isAdmin ? 'Admin' : 'Funcionario',
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ponto registrado com sucesso!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao registrar ponto: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registrar Ponto')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_isAdmin)
              ElevatedButton(
                onPressed: () {
                  // Para o Admin, ele pode ver o histórico dos pontos
                  Navigator.pushNamed(context, '/historico');
                },
                child: Text('Ver Histórico de Pontos'),
              ),
            ElevatedButton(
              onPressed: _registrarPonto,
              child: Text('Registrar Meu Ponto'),
            ),
          ],
        ),
      ),
    );
  }
}
