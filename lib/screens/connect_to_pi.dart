import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../shared/my_page_frame.dart';

class ConnectToPi extends HookConsumerWidget {
  const ConnectToPi({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MyPageFrame(
      children: [
        Text('Connect Device to Wifi',
            style: Theme.of(context).textTheme.headline5),
        const SizedBox(height: 20),
        const Text(
            '1. Connect to Device Hotspot (named something that begins with Evergreen).'),
        const SizedBox(height: 20),
      ],
      bottomChildren: [
        ElevatedButton(
            child: const Text('Continue'),
            onPressed: () {
              context.goNamed('enter wifi');
            }),
        const ElevatedButton(child: Text('Get Help'), onPressed: null),
      ],
    );
  }
}
