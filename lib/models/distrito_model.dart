import 'dart:convert';

class DistritoModel {
  int id;
  String nome;
  int idEstado;
  DistritoModel({
    this.id,
    this.nome,
    this.idEstado,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'idEstado': idEstado,
    };
  }

  factory DistritoModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return DistritoModel(
      id: map['id'],
      nome: map['nome'],
      idEstado: map['idEstado'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DistritoModel.fromJson(String source) =>
      DistritoModel.fromMap(json.decode(source));
}
