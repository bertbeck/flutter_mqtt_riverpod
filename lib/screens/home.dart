import 'package:flutter/material.dart';
import 'package:flutter_mqtt_riverpod/screens/route2.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'route1.dart';
import 'route2.dart';
import 'route3.dart';

final _router = GoRouter(
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Route1(),
    ),
    GoRoute(
      path: '/route2',
      builder: (context, state) => const Route2(),
    ),
    GoRoute(
      path: '/route3',
      builder: (context, state) => const Route3(),
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
    );
  }
}
