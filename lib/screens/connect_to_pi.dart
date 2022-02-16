import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../api/iot.dart';

class ConnectToPi extends HookConsumerWidget {
  const ConnectToPi({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connect to Pi'),
      ),
      body: const SafeArea(child: ConnectToPiScreen()),
    );
  }
}

class ConnectToPiScreen extends HookConsumerWidget {
  const ConnectToPiScreen({
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
            ElevatedButton(
              onPressed: () {
                context.goNamed('scan wifi');
              },
              child: const Text('Connect!'),
            ),
          ],
        ),
      ),
    );
  }
}
