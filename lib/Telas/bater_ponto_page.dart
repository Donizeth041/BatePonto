import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BaterPontoPage extends StatefulWidget {
  @override
  _BaterPontoPageState createState() => _BaterPontoPageState();
}

class _BaterPontoPageState extends State<BaterPontoPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Função para registrar o ponto
  Future<void> _registrarPonto() async {
    final user = _auth.currentUser;
    if (user != null) {
      final data = {
        'usuarioId': user.uid,
        'nome': user.displayName,
        'dataHora': Timestamp.now(),
      };

      // Salvando o ponto no Firebase Firestore
      await _firestore.collection('pontos').add(data);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Ponto registrado com sucesso!'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bater Ponto')),
      body: Center(
        child: ElevatedButton(
          onPressed: _registrarPonto,
          child: Text('Registrar Ponto'),
        ),
      ),
    );
  }
}
