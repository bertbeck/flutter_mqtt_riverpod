import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'amplifyconfiguration.dart';
import 'models/ModelProvider.dart';
import 'screens/auth.dart';

Future<void> main() async {
  runApp(const Center(child: CircularProgressIndicator()));
  try {
    await Amplify.addPlugin(AmplifyAuthCognito());
    // await Amplify.configure(amplifyconfig);

// Add the following lines to your app initialization to add the DataStore plugin
    AmplifyDataStore datastorePlugin =
        AmplifyDataStore(modelProvider: ModelProvider.instance);
    Amplify.addPlugin(datastorePlugin);
    await Amplify.addPlugin(AmplifyAPI(modelProvider: ModelProvider.instance));
    await Amplify.configure(amplifyconfig);
  } on Exception catch (e) {
    throw Exception('Could not configure Amplify: $e');
  }
  runApp(
    const ProviderScope(
      // overrides: [
      //   getWifiListProvider.overrideWithProvider(
      //     FutureProvider(
      //       (ref) => Future.delayed(
      //           const Duration(seconds: 3), () => ['a', 'b', 'c']),
      //     ),
      //   ),
      //   setCredentialsOnPiProvider.overrideWithProvider(
      //     FutureProvider(
      //       (ref) => Future.delayed(const Duration(seconds: 3), () => true),
      //     ),
      //   ),
      //   setWifiOnPiProvider.overrideWithProvider(
      //     FutureProvider(
      //       (ref) => Future.delayed(const Duration(seconds: 3), () => true),
      //     ),
      //   ),
      //   getUuidProvider.overrideWithProvider(
      //     FutureProvider(
      //       (ref) =>
      //           Future.delayed(const Duration(seconds: 3), () => 'RandalPi'),
      //     ),
      //   ),
      //   setIotPolicyProvider.overrideWithProvider(
      //     FutureProvider(
      //         (ref) => Future.delayed(const Duration(seconds: 3), () => true)),
      //   ),
      //   getIsPiOnlineProvider.overrideWithProvider(FutureProvider(
      //       (ref) => Future.delayed(const Duration(seconds: 3), () => true))),
      // ],
      child: Auth(),
    ),
  );
}
