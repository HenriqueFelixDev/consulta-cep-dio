import '../../datasources/cep/cep_datasource.dart';
import '../../models/cep_model.dart';

class CepRepository {
  final CepDatasource _cepDatasource;

  const CepRepository({
    required CepDatasource cepDatasource,
  }) : _cepDatasource = cepDatasource;

  Future<String> createCep(CepModel cep) {
     return _cepDatasource.createCep(cep);
  }

  Future<void> updateCep(CepModel cep) {
    return _cepDatasource.updateCep(cep);
  }

  Future<List<CepModel>> searchCeps(String search) {
    return _cepDatasource.searchCeps(search);
  }

  Future<void> deleteCep(String id) {
    return _cepDatasource.deleteCep(id);
  }
}
