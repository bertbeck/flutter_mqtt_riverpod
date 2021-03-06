import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../shared/my_page_frame.dart';

class AddStorage extends HookConsumerWidget {
  const AddStorage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MyPageFrame(
      children: [
        Text('Add Storage', style: Theme.of(context).textTheme.headline5),
        const SizedBox(height: 20),
      ],
      bottomChildren: [
        ElevatedButton(
            child: const Text('Continue'),
            onPressed: () {
              context.goNamed('dashboard');
            }),
        const ElevatedButton(child: Text('Get Help'), onPressed: null),
      ],
    );
  }
}
