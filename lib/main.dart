import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'amplifyconfiguration.dart';
import 'screens/home.dart';

Future<void> main() async {
  runApp(const Center(child: CircularProgressIndicator()));
  try {
    await Amplify.addPlugin(AmplifyAuthCognito());
    await Amplify.configure(amplifyconfig);
  } on Exception catch (e) {
    if (kDebugMode) {
      print('Could not configure Amplify: $e');
    }
  }
  runApp(
    const ProviderScope(
      child: Home(),
    ),
  );
}
