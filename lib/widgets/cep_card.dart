import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cep_model.dart';
import '../pages/edit/cep_edit_page.dart';
import '../pages/search/cep_search_controller.dart';

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
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () async {
          final controller = context.read<CepSearchController>();

          final refresh = await Navigator.push<bool>(
            context,
            MaterialPageRoute(builder: (_) => CepEditPage(initialValue: cep)),
          );
          
          if (refresh == true) {
            controller.searchCeps();
          }
        },
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
      ),
    );
  }
}
