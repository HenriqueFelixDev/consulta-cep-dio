import 'dart:convert';

import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class CepModel {
  final String id;
  final String cep;
  final String logradouro;
  final String complemento;
  final String bairro;
  final String localidade;
  final String uf;
  final String ibge;
  final String gia;
  final String ddd;
  final String siafi;

  const CepModel({
    required this.id,
    required this.cep,
    required this.logradouro,
    required this.complemento,
    required this.bairro,
    required this.localidade,
    required this.uf,
    required this.ibge,
    required this.gia,
    required this.ddd,
    required this.siafi,
  });

  factory CepModel.initial() {
    return const CepModel(
      id: '',
      cep: '',
      logradouro: '',
      complemento: '',
      bairro: '',
      localidade: '',
      uf: '',
      ibge: '',
      gia: '',
      ddd: '',
      siafi: '',
    );
  }

  CepModel copyWith({
    String? id,
    String? cep,
    String? logradouro,
    String? complemento,
    String? bairro,
    String? localidade,
    String? uf,
    String? ibge,
    String? gia,
    String? ddd,
    String? siafi,
  }) {
    return CepModel(
      id: id ?? this.id,
      cep: cep ?? this.cep,
      logradouro: logradouro ?? this.logradouro,
      complemento: complemento ?? this.complemento,
      bairro: bairro ?? this.bairro,
      localidade: localidade ?? this.localidade,
      uf: uf ?? this.uf,
      ibge: ibge ?? this.ibge,
      gia: gia ?? this.gia,
      ddd: ddd ?? this.ddd,
      siafi: siafi ?? this.siafi,
    );
  }

  ParseObject toParseObject([bool includeId = true]) {
    final object = ParseObject('Cep')
      ..set('cep', cep)
      ..set('logradouro', logradouro)
      ..set('complemento', complemento)
      ..set('bairro', bairro)
      ..set('localidade', localidade)
      ..set('uf', uf)
      ..set('ibge', ibge)
      ..set('gia', gia)
      ..set('ddd', ddd)
      ..set('siafi', siafi);

    if (includeId) {
      object.objectId = id;
    }

    return object;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'cep': cep,
      'logradouro': logradouro,
      'complemento': complemento,
      'bairro': bairro,
      'localidade': localidade,
      'uf': uf,
      'ibge': ibge,
      'gia': gia,
      'ddd': ddd,
      'siafi': siafi,
    };
  }

  factory CepModel.fromMap(Map<String, dynamic> map) {
    return CepModel(
      id: map['id'] != null
          ? map['id'] as String
          : (map['objectId'] != null ? map['objectId'] as String : ''),
      cep: (map['cep'] as String).replaceAll(RegExp('[^0-9]'), ''),
      logradouro: map['logradouro'] as String,
      complemento: map['complemento'] as String,
      bairro: map['bairro'] as String,
      localidade: map['localidade'] as String,
      uf: map['uf'] as String,
      ibge: map['ibge'] as String,
      gia: map['gia'] as String,
      ddd: map['ddd'] as String,
      siafi: map['siafi'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CepModel.fromJson(String source) =>
      CepModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CepModel(id: $id, cep: $cep, logradouro: $logradouro, complemento: $complemento, bairro: $bairro, localidade: $localidade, uf: $uf, ibge: $ibge, gia: $gia, ddd: $ddd, siafi: $siafi)';
  }

  @override
  bool operator ==(covariant CepModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.cep == cep &&
        other.logradouro == logradouro &&
        other.complemento == complemento &&
        other.bairro == bairro &&
        other.localidade == localidade &&
        other.uf == uf &&
        other.ibge == ibge &&
        other.gia == gia &&
        other.ddd == ddd &&
        other.siafi == siafi;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        cep.hashCode ^
        logradouro.hashCode ^
        complemento.hashCode ^
        bairro.hashCode ^
        localidade.hashCode ^
        uf.hashCode ^
        ibge.hashCode ^
        gia.hashCode ^
        ddd.hashCode ^
        siafi.hashCode;
  }
}
