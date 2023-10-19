import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'datasources/cep/cep_datasource.dart';
import 'datasources/cep/cep_datasource_impl.dart';
import 'datasources/cep/cep_datasource_proxy.dart';
import 'pages/search/cep_search_page.dart';
import 'repositories/cep/cep_repository.dart';
import 'styles/app_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<CepDatasource>(
          create: (_) => CepDatasourceProxy(
            cepDatasource: CepDatasourceImpl(),
          ),
        ),
        Provider<CepRepository>(
          create: (context) => CepRepository(cepDatasource: context.read()),
        ),
      ],
      child: MaterialApp(
        title: 'Consulta CEP',
        theme: AppTheme.light(),
        home: const CepSearchPage(),
      ),
    );
  }
}
