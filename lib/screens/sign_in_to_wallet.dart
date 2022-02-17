import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../shared/my_page_frame.dart';

class SignInToWallet extends HookConsumerWidget {
  const SignInToWallet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MyPageFrame(
      children: [
        Text('Sign In To Wallet', style: Theme.of(context).textTheme.headline5),
        const SizedBox(height: 20),
        const Text('Sign in to the official wallet on your device.'),
        const SizedBox(height: 20),
        ElevatedButton(
            child: const Text('Continue'),
            onPressed: () {
              // context.goNamed('authorize device');
            }),
        const ElevatedButton(child: Text('Get Help'), onPressed: null),
      ],
    );
  }
}
