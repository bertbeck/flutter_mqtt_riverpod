import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../shared/my_page_frame.dart';

class AddYourDevice extends HookConsumerWidget {
  const AddYourDevice({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MyPageFrame(
      children: [
        Text('Add Your Device', style: Theme.of(context).textTheme.headline5),
        const SizedBox(height: 20),
        const Text(
          '''
1. Connect your Device to Ethernet (optional).
2. Plug your Device into Power.
3. Wait 3 Minutes.
4. Is the LED Red or Blue?
''',
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
      ],
      bottomChildren: [
        ElevatedButton(
            child: const Text('Red'),
            onPressed: () => context.goNamed('connect to pi')),
        ElevatedButton(
            child: const Text('Blue'),
            onPressed: () => context.goNamed('link device to account')),
      ],
    );
  }
}
