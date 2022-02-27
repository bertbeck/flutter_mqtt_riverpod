import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../shared/my_page_frame.dart';

class LinkDeviceToAccount extends HookConsumerWidget {
  const LinkDeviceToAccount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MyPageFrame(
      children: [
        Text('Link Device To Account',
            style: Theme.of(context).textTheme.headline5),
        const SizedBox(height: 20),
        const Text('Enter Device ID'), //todo add device id field
        const SizedBox(height: 20),
      ],
      bottomChildren: [
        ElevatedButton(
            child: const Text('Continue'),
            onPressed: () {
              context.pushNamed('authorize device');
            }),
        const ElevatedButton(child: Text('Get Help'), onPressed: null),
      ],
    );
  }
}
