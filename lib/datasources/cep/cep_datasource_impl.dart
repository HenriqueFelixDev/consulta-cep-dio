import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import '../../models/cep_model.dart';
import 'cep_datasource.dart';

class CepDatasourceImpl implements CepDatasource {
  @override
  Future<String> createCep(CepModel cep) async {
    final parseCep = cep.toParseObject(false);
    final response = await parseCep.save();

    if (response.success) {
      return parseCep.objectId!;
    }

    throw Exception('Não foi possível salvar o cep');
  }

  @override
  Future<void> updateCep(CepModel cep) async {
    await cep.toParseObject().update();
  }

  @override
  Future<void> deleteCep(String id) async {
    await ParseObject('Cep').delete(id: id);
  }

  @override
  Future<List<CepModel>> searchCeps(String search) async {
    final queryBuilder = QueryBuilder(ParseObject('Cep'))
      ..whereContains('cep', search);

    final response = await queryBuilder.query();

    if (response.results == null) return [];

    return response.results!.map((result) {
      return CepModel.fromMap((result as ParseObject).toJson());
    }).toList();
  }
}
