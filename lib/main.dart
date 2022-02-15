import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'amplifyconfiguration.dart';
import 'api/http_api.dart';
import 'screens/auth.dart';

Future<void> main() async {
  runApp(const Center(child: CircularProgressIndicator()));
  try {
    await Amplify.addPlugin(AmplifyAuthCognito());
    await Amplify.configure(amplifyconfig);
  } on Exception catch (e) {
    throw Exception('Could not configure Amplify: $e');
  }
  runApp(
    ProviderScope(
      overrides: [
        apiWifiListProvider.overrideWithValue(
          const AsyncValue.data(
            ['a', 'b', 'c'],
          ),
        ),
        apiSendWifiProvider.overrideWithValue(
          const AsyncValue.data(true),
        )
      ],
      child: const Auth(),
    ),
  );
}
