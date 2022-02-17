import 'package:flutter/material.dart';
import 'package:flutter_mqtt_riverpod/screens/authorize_device.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../shared/theme.dart';
import 'add_your_device.dart';
import 'connect_to_pi.dart';
import 'enter_wifi.dart';

final _router = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/addYourDevice',
  routes: [
    GoRoute(
      path: '/addYourDevice',
      name: 'add your device',
      builder: (context, state) => const AddYourDevice(),
    ),
    GoRoute(
      path: '/connectToPi',
      name: 'connect to pi',
      builder: (context, state) => const ConnectToPi(),
    ),
    GoRoute(
      path: '/enterWifi',
      name: 'enter wifi',
      builder: (context, state) => const EnterWifi(),
    ),
    GoRoute(
      path: '/authorizeDevice',
      name: 'authorize device',
      builder: (context, state) => const AuthorizeDevice(),
    ),
  ],
);

class Home extends HookConsumerWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      theme: getGlobalTheme(),
    );
  }
}
