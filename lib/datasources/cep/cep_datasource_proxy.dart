import 'package:dio/dio.dart';

import 'cep_datasource.dart';
import '../../models/cep_model.dart';

class CepDatasourceProxy implements CepDatasource {
  final CepDatasource _cepDatasource;

  const CepDatasourceProxy({
    required CepDatasource cepDatasource,
  }) : _cepDatasource = cepDatasource;

  @override
  Future<String> createCep(CepModel cep) {
    return _cepDatasource.createCep(cep);
  }

  @override
  Future<void> updateCep(CepModel cep) {
    return _cepDatasource.updateCep(cep);
  }

  @override
  Future<void> deleteCep(String id) {
    return _cepDatasource.deleteCep(id);
  }

  @override
  Future<List<CepModel>> searchCeps(String search) async {
    final datasourceResults = await _cepDatasource.searchCeps(search);

    if (datasourceResults.isNotEmpty) {
      return datasourceResults;
    }

    final searchIsFullCep = RegExp(r'^\d{8}$').hasMatch(search);

    if (!searchIsFullCep) {
      return [];
    }

    final cep = await _getCepFromAPI(search);
    
    final createdId = await createCep(cep);

    return [cep.copyWith(id: createdId)];
  }

  Future<CepModel> _getCepFromAPI(String cep) async {
    final httpResponse = await Dio().get('https://viacep.com.br/ws/$cep/json/');
    return CepModel.fromMap(httpResponse.data);
  }
}
