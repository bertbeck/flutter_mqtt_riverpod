import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../shared/theme.dart';
import 'add_storage.dart';
import 'add_your_device.dart';
import 'authorize_device.dart';
import 'connect_to_pi.dart';
import 'dashboard.dart';
import 'enter_wifi.dart';
import 'link_device_to_account.dart';
import 'sign_in_to_wallet.dart';
import 'wait_for_blue.dart';

final _router = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/Dashboard',
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
    GoRoute(
      path: '/linkDeviceToAccount',
      name: 'link device to account',
      builder: (context, state) => const LinkDeviceToAccount(),
    ),
    GoRoute(
      path: '/WaitForBlue',
      name: 'wait for blue',
      builder: (context, state) => const WaitForBlue(),
    ),
    GoRoute(
      path: '/SignInToWallet',
      name: 'sign in to wallet',
      builder: (context, state) => const SignInToWallet(),
    ),
    GoRoute(
        path: '/AddStorage',
        name: 'add storage',
        builder: (context, state) => const AddStorage()),
    GoRoute(
        path: '/Dashboard',
        name: 'dashboard',
        builder: (context, state) => const Dashboard()),
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
