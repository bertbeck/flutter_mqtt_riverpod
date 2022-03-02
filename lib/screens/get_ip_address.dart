import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../api/devices_model.dart';
import '../shared/my_page_frame.dart';

class GetIPAddress extends HookConsumerWidget {
  const GetIPAddress({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final devices = ref.watch(ipProvider);
    debugPrint('$devices');
    debugPrint('hello');

    return MyPageFrame(children: [
      const SizedBox(height: 20),
      Text('devices $devices'),
    ], bottomChildren: const []);
  }
}
