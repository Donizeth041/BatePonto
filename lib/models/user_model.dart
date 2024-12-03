// lib/models/user_model.dart

class UserModel {
  final String id;
  final String nome;
  final String email;
  final String cargo; // Pode ser 'administrador' ou 'funcionario'
  final String? telefone;
  final String? endereco;

  // Construtor
  UserModel({
    required this.id,
    required this.nome,
    required this.email,
    required this.cargo,
    this.telefone,
    this.endereco,
  });

  // Método para criar um UserModel a partir de um Map (quando recuperar do Firebase)
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      nome: map['nome'],
      email: map['email'],
      cargo: map['cargo'],
      telefone: map['telefone'],
      endereco: map['endereco'],
    );
  }

  // Método para converter um UserModel para Map (quando salvar no Firebase)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'email': email,
      'cargo': cargo,
      'telefone': telefone,
      'endereco': endereco,
    };
  }
}
