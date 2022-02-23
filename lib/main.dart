import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'amplifyconfiguration.dart';
import 'api/http_api.dart';
import 'api/iot.dart';
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
        // getWifiListProvider.overrideWithProvider(
        //   FutureProvider(
        //     (ref) => Future.delayed(
        //         const Duration(seconds: 3), () => ['a', 'b', 'c']),
        //   ),
        // ),
        // setWifiOnPiProvider.overrideWithProvider(
        //   FutureProvider(
        //     (ref) => Future.delayed(const Duration(seconds: 3), () => true),
        //   ),
        // ),
        // getUuidProvider.overrideWithProvider(
        //   FutureProvider(
        //     (ref) =>
        //         Future.delayed(const Duration(seconds: 3), () => 'RandalPi'),
        //   ),
        // ),
        // setIotPolicyProvider.overrideWithProvider(
        //   FutureProvider(
        //       (ref) => Future.delayed(const Duration(seconds: 3), () => true)),
        // ),
        // getIsPiOnlineProvider.overrideWithProvider(FutureProvider(
        //     (ref) => Future.delayed(const Duration(seconds: 3), () => true))),
      ],
      child: const Auth(),
    ),
  );
}
