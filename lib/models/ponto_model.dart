import 'package:cloud_firestore/cloud_firestore.dart'; // Para usar Timestamp do Firebase

class PontoModel {
  final String id;
  final String userId; // ID do usuário que bateu o ponto
  final DateTime dataHora; // Data e hora do ponto

  // Construtor
  PontoModel({
    required this.id,
    required this.userId,
    required this.dataHora,
  });

  // Método para criar um PontoModel a partir de um Map (quando recuperar do Firebase)
  factory PontoModel.fromMap(Map<String, dynamic> map) {
    return PontoModel(
      id: map['id'],
      userId: map['userId'],
      dataHora: (map['dataHora'] as Timestamp)
          .toDate(), // Convertendo de Timestamp para DateTime
    );
  }

  // Método para converter um PontoModel para Map (quando salvar no Firebase)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'dataHora': dataHora, // Firebase lida bem com DateTime diretamente
    };
  }
}
