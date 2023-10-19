import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cep_model.dart';
import '../pages/edit/cep_edit_page.dart';
import '../pages/search/cep_search_controller.dart';

class CepCard extends StatelessWidget {
  final CepModel cep;

  const CepCard({super.key, required this.cep});

  Future<bool> _confirmDeletion(BuildContext context) async {
    final controller = context.read<CepSearchController>();
    FocusScope.of(context).unfocus();

    final dismiss = await showDialog(
      context: context,
      builder: (_) => _DeleteConfirmationDialog(cep: cep),
    );

    if (dismiss) {
      await controller.deleteCep(cep);
      return controller.error == null;
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
        side: const BorderSide(color: Color(0xFFF0F0F0)),
      ),
      clipBehavior: Clip.antiAlias,
      child: Dismissible(
        key: Key(cep.id),
        direction: DismissDirection.endToStart,
        background: Container(
          color: colors.error,
          alignment: const Alignment(0.8, 0.0),
          child: Icon(Icons.delete, color: colors.onError),
        ),
        confirmDismiss: (_) => _confirmDeletion(context),
        child: _CepCardContent(cep: cep),
      ),
    );
  }
}

class _CepCardContent extends StatelessWidget {
  final CepModel cep;
  const _CepCardContent({required this.cep});

  Future<void> _openEditPage(BuildContext context) async {
    final controller = context.read<CepSearchController>();

    final refresh = await Navigator.push<bool>(
      context,
      MaterialPageRoute(builder: (_) => CepEditPage(initialValue: cep)),
    );

    if (refresh == true) {
      controller.searchCeps();
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final logradouro = cep.logradouro.isEmpty ? '' : '${cep.logradouro} - ';
    final bairro = cep.bairro.isEmpty ? '' : '${cep.bairro} - ';

    final address = '$logradouro'
        '$bairro'
        '${cep.localidade}/${cep.uf} - DDD ${cep.ddd}';

    return InkWell(
      onTap: () => _openEditPage(context),
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

class _DeleteConfirmationDialog extends StatelessWidget {
  final CepModel cep;
  const _DeleteConfirmationDialog({required this.cep});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return AlertDialog(
      title: Text.rich(
        TextSpan(text: 'Excluir CEP ', children: [
          TextSpan(
            text: cep.cep,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const TextSpan(text: '?'),
        ]),
      ),
      content: const Text(
        'Após a confirmação ele será excluído e não poderá ser recuperado.',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, true),
          style: TextButton.styleFrom(foregroundColor: colors.error),
          child: const Text('Sim, excluir'),
        ),
        ElevatedButton(
          onPressed: () => Navigator.pop(context, false),
          child: const Text('Cancelar'),
        ),
      ],
    );
  }
}
