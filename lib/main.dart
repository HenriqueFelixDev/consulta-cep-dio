import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import 'app_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load();

  await Parse().initialize(
    dotenv.env['PARSE_APP_ID'] ?? '',
    dotenv.env['PARSE_SERVER_URL'] ?? '',
    clientKey: dotenv.env['PARSE_CLIENT_KEY'],
    autoSendSessionId: true,
    debug: kDebugMode,
  );

  runApp(const AppWidget());
}
