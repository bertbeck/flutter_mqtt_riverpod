// remember to add flutter_hooks and hooks_riverpod to pubspec.yaml
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends HookConsumerWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const MaterialApp(
      // themeMode: ThemeMode.dark,
      // title: 'Call me an app!',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: Route1(),
    );
  }
}

class Route1 extends HookConsumerWidget {
  const Route1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Route 1'),
      ),
      body: const SafeArea(child: Route1Page()),
      // floatingActionButton: MyFAB(),
    );
  }
}

class Route1Page extends HookConsumerWidget {
  const Route1Page({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '''
Before attemping to connect to your pi, please ensure you have done the following:
1. Start the pi.
2. in your device's WiFi settings, select the Evergreen network once it is available (usually takes a half minute).
3. Return back to this app and click the button below.
''',
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Route2()),
                );
              },
              child: const Text('Connect!'),
            ),
          ],
        ),
      ),
    );
  }
}

class Route2 extends HookConsumerWidget {
  const Route2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Route 2'),
      ),
      body: const SafeArea(child: Route2Page()),
      // floatingActionButton: MyFAB(),
    );
  }
}

class Route2Page extends HookConsumerWidget {
  const Route2Page({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '[pi connected]',
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(
                  context,
                );
              },
              child: const Text('Done!'),
            ),
          ],
        ),
      ),
    );
  }
}
