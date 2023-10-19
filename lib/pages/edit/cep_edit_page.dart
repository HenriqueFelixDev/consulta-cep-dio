import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/cep_model.dart';
import '../../widgets/widgets.dart';
import 'cep_edit_controller.dart';

class CepEditPage extends StatelessWidget {
  final CepModel? initialValue;
  const CepEditPage({super.key, this.initialValue});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CepEditController(
        initialCep: initialValue,
        cepRepository: context.read(),
      ),
      child: const _CepEditView(),
    );
  }
}

class _CepEditView extends StatefulWidget {
  const _CepEditView();

  @override
  State<_CepEditView> createState() => _CepEditViewState();
}

class _CepEditViewState extends State<_CepEditView> {
  @override
  void initState() {
    super.initState();

    context.read<CepEditController>().addListener(_onStateChanged);
  }

  void _onStateChanged() {
    final controller = context.read<CepEditController>();

    if (controller.saved) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          const CepSnackbar.success(content: Text('CEP salvo com sucesso!')),
        );
      Navigator.pop(context, true);
      return;
    }

    if (controller.error != null) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(CepSnackbar.error(content: Text(controller.error!)));
    }
  }

  void _onSave() {
    context.read<CepEditController>().save();
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.read<CepEditController>();

    final fields = [
      TextFormField(
        initialValue: controller.cepModel.cep,
        onChanged: (value) => controller.cep = value,
        decoration: const InputDecoration(
          labelText: 'CEP',
        ),
      ),
      TextFormField(
        initialValue: controller.cepModel.logradouro,
        onChanged: (value) => controller.logradouro = value,
        decoration: const InputDecoration(
          labelText: 'Logradouro',
        ),
      ),
      TextFormField(
        initialValue: controller.cepModel.complemento,
        onChanged: (value) => controller.complemento = value,
        decoration: const InputDecoration(
          labelText: 'Complemento',
        ),
      ),
      TextFormField(
        initialValue: controller.cepModel.bairro,
        onChanged: (value) => controller.bairro = value,
        decoration: const InputDecoration(
          labelText: 'Bairro',
        ),
      ),
      TextFormField(
        initialValue: controller.cepModel.localidade,
        onChanged: (value) => controller.localidade = value,
        decoration: const InputDecoration(
          labelText: 'Cidade',
        ),
      ),
      TextFormField(
        initialValue: controller.cepModel.uf,
        onChanged: (value) => controller.uf = value,
        decoration: const InputDecoration(
          labelText: 'UF',
        ),
      ),
      TextFormField(
        initialValue: controller.cepModel.ibge,
        onChanged: (value) => controller.ibge = value,
        decoration: const InputDecoration(
          labelText: 'IBGE',
        ),
      ),
      TextFormField(
        initialValue: controller.cepModel.gia,
        onChanged: (value) => controller.gia = value,
        decoration: const InputDecoration(
          labelText: 'GIA',
        ),
      ),
      TextFormField(
        initialValue: controller.cepModel.ddd,
        onChanged: (value) => controller.ddd = value,
        decoration: const InputDecoration(
          labelText: 'DDD',
        ),
      ),
      TextFormField(
        initialValue: controller.cepModel.siafi,
        onChanged: (value) => controller.siafi = value,
        decoration: const InputDecoration(
          labelText: 'SIAFI',
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('Editar CEP'),
        forceMaterialTransparency: true,
        automaticallyImplyLeading: false,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16.0),
        separatorBuilder: (_, __) => const SizedBox(height: 16.0),
        itemCount: fields.length,
        itemBuilder: (_, index) => fields[index],
      ),
      bottomNavigationBar: _ButtonsBar(onSavePressed: _onSave),
    );
  }
}

class _ButtonsBar extends StatelessWidget {
  final VoidCallback onSavePressed;
  const _ButtonsBar({required this.onSavePressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 8.0),
      child: Row(
        children: [
          Expanded(
            child: Consumer<CepEditController>(
              builder: (context, controller, child) {
                return ElevatedButton(
                  onPressed: controller.isLoading ? null : onSavePressed,
                  child: controller.isLoading
                      ? const SizedBox(
                          width: 16.0,
                          height: 16.0,
                          child: CircularProgressIndicator(),
                        )
                      : const Text('Salvar'),
                );
              },
            ),
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            ),
          ),
        ],
      ),
    );
  }
}
