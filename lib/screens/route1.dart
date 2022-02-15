import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../api/iot.dart';

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
    );
  }
}

class Route1Page extends HookConsumerWidget {
  const Route1Page({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final iotDataPlane = ref.watch(iotDataPlaneProvider);
    final getThingShadow = ref.watch(getThingShadowProvider);
    // final getShadowList = ref.watch(getShadowListProvider);
    // final describeEndpoint = ref.watch(describeEndpointProvider);
    // final policy = ref.watch(getPolicyProvider);
    // final getSsid = ref.watch(getSsidProvider);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${getThingShadow.value}',
              // style: Theme.of(context).textTheme.headline6,
            ),
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
                context.go('/route2');
              },
              child: const Text('Connect!'),
            ),
          ],
        ),
      ),
    );
  }
}
