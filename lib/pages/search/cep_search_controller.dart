import 'package:flutter/material.dart';

import '../../models/cep_model.dart';
import '../../repositories/cep/cep_repository.dart';

class CepSearchController extends ChangeNotifier {
  final CepRepository _cepRepository;
  
  CepSearchController({
    required CepRepository cepRepository,
  }) : _cepRepository = cepRepository;

  String _search = '';
  String get search => _search;
  set search(String value) => _search = value;

  List<CepModel> _ceps = [];
  List<CepModel> get ceps => _ceps;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  Future<void> searchCeps() async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      _ceps = await _cepRepository.searchCeps(_search);
    } catch (e) {
      _error = 'Não foi possível consultar o CEP';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}