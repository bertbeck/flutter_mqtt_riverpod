import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../api/iot.dart';
import '../shared/my_page_frame.dart';

class Dashboard extends HookConsumerWidget {
  const Dashboard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getIp = ref.watch(getThingShadowProvider('RandalPi:ip'));
    final getFarmConfig =
        ref.watch(getThingShadowProvider('RandalPi:farm_config'));
    return MyPageFrame(
      children: [
        Text('Dashboard', style: Theme.of(context).textTheme.headline5),
        const SizedBox(height: 20),
        Text('IP: ${getIp.toString()}'),
        Text('Farm Config: ${getFarmConfig.toString()}'),
        const Text('Farm status'),
        const Text('Wallet status'),
        const Text('Device configuration'),
        const Text('Device status'),
        const SizedBox(height: 20),
        ElevatedButton(
            child: const Text('Continue'),
            onPressed: () {
              // context . goNamed('authorize device');
            }),
      ],
    );
  }
}
