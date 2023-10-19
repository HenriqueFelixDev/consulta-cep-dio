import 'package:consulta_cep_dio/models/cep_model.dart';
import 'package:consulta_cep_dio/repositories/cep/cep_repository.dart';
import 'package:flutter/foundation.dart';

class CepEditController extends ChangeNotifier {
  final CepRepository _cepRepository;

  CepEditController({
    CepModel? initialCep,
    required CepRepository cepRepository,
  })  : _cep = initialCep ?? CepModel.initial(),
        _cepRepository = cepRepository;

  CepModel _cep;
  CepModel get cepModel => _cep;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _saved = false;
  bool get saved => _saved;

  String? _error;
  String? get error => _error;

  set cep(String value) => _cep = _cep.copyWith(cep: value);
  set logradouro(String value) => _cep = _cep.copyWith(logradouro: value);
  set complemento(String value) => _cep = _cep.copyWith(complemento: value);
  set bairro(String value) => _cep = _cep.copyWith(bairro: value);
  set localidade(String value) => _cep = _cep.copyWith(localidade: value);
  set uf(String value) => _cep = _cep.copyWith(uf: value);
  set ibge(String value) => _cep = _cep.copyWith(ibge: value);
  set gia(String value) => _cep = _cep.copyWith(gia: value);
  set ddd(String value) => _cep = _cep.copyWith(ddd: value);
  set siafi(String value) => _cep = _cep.copyWith(siafi: value);

  Future<void> save() async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      await _cepRepository.updateCep(_cep);

      _saved = true;
    } catch (e) {
      _error = 'Ocorreu um erro ao salvar o CEP';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
