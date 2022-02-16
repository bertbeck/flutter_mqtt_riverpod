import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'connect_to_pi.dart';
import 'add_wifi.dart';
import 'scan_wifi.dart';

final _router = GoRouter(
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      name: 'connect to pi',
      builder: (context, state) => const ConnectToPi(),
    ),
    GoRoute(
      path: '/route2',
      name: 'scan wifi',
      builder: (context, state) => const ScanWifi(),
    ),
    GoRoute(
      name: 'add wifi',
      path: '/route3',
      builder: (context, state) => const AddWifi(),
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
      theme: ThemeData.from(
          colorScheme:
              ColorScheme.fromSeed(seedColor: const Color(0xFF5DB075))),
    );
  }
}
