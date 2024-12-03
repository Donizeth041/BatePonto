// pesquisar_pontos.dart
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PesquisarPontosPage extends StatefulWidget {
  @override
  _PesquisarPontosPageState createState() => _PesquisarPontosPageState();
}

class _PesquisarPontosPageState extends State<PesquisarPontosPage> {
  final _searchController = TextEditingController();
  final _firestore = FirebaseFirestore.instance;

  // Método para pesquisar pontos
  Stream<QuerySnapshot> _searchPoints(String query) {
    if (query.isEmpty) {
      return _firestore.collection('pontos').snapshots();
    } else {
      return _firestore
          .collection('pontos')
          .where('nome', isGreaterThanOrEqualTo: query)
          .where('nome', isLessThanOrEqualTo: query + '\uf8ff')
          .snapshots();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pesquisar Pontos"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Pesquisar por nome',
                suffixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {});
              },
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: _searchPoints(_searchController.text),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }

                  var points = snapshot.data!.docs;
                  return ListView.builder(
                    itemCount: points.length,
                    itemBuilder: (context, index) {
                      var point = points[index];
                      return ListTile(
                        title: Text(point['nome']),
                        subtitle: Text('Data: ${point['data']}'),
                        trailing: Text('Hora: ${point['hora']}'),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
