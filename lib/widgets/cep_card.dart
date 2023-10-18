import 'package:flutter/material.dart';

import '../models/cep_model.dart';

class CepCard extends StatelessWidget {
  final CepModel cep;

  const CepCard({super.key, required this.cep});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final logradouro = cep.logradouro.isEmpty ? '' : '${cep.logradouro} - ';
    final bairro = cep.bairro.isEmpty ? '' : '${cep.bairro} - ';

    final address = '$logradouro'
        '$bairro'
        '${cep.localidade}/${cep.uf} - DDD ${cep.ddd}';

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
        side: const BorderSide(color: Color(0xFFF0F0F0)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(cep.cep, style: textTheme.titleLarge),
            const SizedBox(height: 8.0),
            Text(address),
            if (cep.complemento.isNotEmpty)
              Text(
                cep.complemento,
                style: const TextStyle(color: Color(0xFF505050)),
              ),
          ],
        ),
      ),
    );
  }
}
