import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/widgets.dart';
import 'cep_search_controller.dart';

class CepSearchPage extends StatelessWidget {
  const CepSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          CepSearchController(cepRepository: context.read())..searchCeps(),
      child: const _CepSearchView(),
    );
  }
}

class _CepSearchView extends StatefulWidget {
  const _CepSearchView();

  @override
  State<_CepSearchView> createState() => _CepSearchViewState();
}

class _CepSearchViewState extends State<_CepSearchView> {
  @override
  void initState() {
    super.initState();

    final controller = context.read<CepSearchController>();

    controller.addListener(() {
      if (controller.error != null) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(CepSnackbar.error(content: Text(controller.error!)));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<CepSearchController>();

    Widget body;

    if (controller.isLoading) {
      body = const Center(child: CircularProgressIndicator());
    } else {
      body = ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: controller.ceps.length,
        itemBuilder: (_, index) => CepCard(cep: controller.ceps[index]),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (_, __) => [
            const SliverToBoxAdapter(child: _CepSearchHeader()),
          ],
          body: body,
        ),
      ),
    );
  }
}

class _CepSearchHeader extends StatelessWidget {
  const _CepSearchHeader();

  @override
  Widget build(BuildContext context) {
    final controller = context.read<CepSearchController>();

    return Container(
      padding: const EdgeInsets.all(16.0),
      height: 120.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage('assets/images/location.jpg'),
          fit: BoxFit.cover,
          alignment: const Alignment(0.0, -0.7),
          colorFilter: ColorFilter.mode(
            Theme.of(context).colorScheme.primary,
            BlendMode.overlay,
          ),
          opacity: 0.5,
        ),
      ),
      child: TextField(
        onChanged: (value) => controller.search = value,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFFEBEFFF),
          suffixIcon: IconButton(
            onPressed: () {
              controller.searchCeps();
            },
            icon: const Icon(Icons.search),
          ),
          hintText: 'Pesquise por um CEP',
        ),
      ),
    );
  }
}
