
import '../../models/cep_model.dart';

abstract interface class CepDatasource {
  Future<String> createCep(CepModel cep);
  Future<void> updateCep(CepModel cep);
  Future<List<CepModel>> searchCeps(String search);
  Future<void> deleteCep(String id);
}