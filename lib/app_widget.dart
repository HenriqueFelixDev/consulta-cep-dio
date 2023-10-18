import 'package:flutter/material.dart';

import 'pages/search/cep_search_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Consulta CEP',
      home: CepSearchPage()
    );
  }
}
