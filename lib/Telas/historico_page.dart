import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HistoricoPage extends StatefulWidget {
  @override
  _HistoricoPageState createState() => _HistoricoPageState();
}

class _HistoricoPageState extends State<HistoricoPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Função para buscar os pontos
  Future<List<DocumentSnapshot>> _buscarHistorico() async {
    final user = _auth.currentUser;
    if (user != null) {
      // Se for administrador, busca todos os pontos
      if (user.email == 'admin@empresa.com') {
        final snapshot = await _firestore.collection('pontos').get();
        return snapshot.docs;
      }
      // Se for funcionário, busca apenas os pontos do usuário atual
      final snapshot = await _firestore
          .collection('pontos')
          .where('usuarioId', isEqualTo: user.uid)
          .get();
      return snapshot.docs;
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Histórico de Ponto')),
      body: FutureBuilder<List<DocumentSnapshot>>(
        future: _buscarHistorico(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Nenhum ponto registrado.'));
          }

          final pontos = snapshot.data!;
          return ListView.builder(
            itemCount: pontos.length,
            itemBuilder: (context, index) {
              final ponto = pontos[index];
              return ListTile(
                title: Text(ponto['nome']),
                subtitle: Text(
                  'Data: ${ponto['dataHora'].toDate()}',
                ),
              );
            },
          );
        },
      ),
    );
  }
}
