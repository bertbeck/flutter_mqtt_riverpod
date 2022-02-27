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
          '''Do you see the Evergreen hotspot?
''',
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
      ],
      bottomChildren: [
        ElevatedButton(
            child: const Text('Yes'),
            onPressed: () => context.pushNamed('connect to pi')),
        const ElevatedButton(child: Text('No'), onPressed: null),
      ], // todo: add a picture of the hotspot
    );
  }
}
